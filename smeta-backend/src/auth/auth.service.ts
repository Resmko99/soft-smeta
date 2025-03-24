// src/auth/auth.service.ts
import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from '../users/users.service';
import * as bcrypt from 'bcrypt';
import { CreateUserDto } from 'src/users/dto/create-user.dto';
import { LoginUserDto } from './dto/login-user.dto';

@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private jwtService: JwtService,
  ) {}

  async validateUser(id: number, password: string): Promise<any> {
    const user = await this.usersService.findOne(id);
    if (user && await bcrypt.compare(password, user.password)) {
      const { password, ...result } = user;
      return result;
    }
    return null;
  }

  async register(createUserDto: CreateUserDto) {
    const { username, password } = createUserDto;

    const hashedPassword = await bcrypt.hash(password, 10);
    const newUser = await this.usersService.create({ username, password: hashedPassword });

    return { message: 'Пользователь успешно зарегистрирован', user: newUser };
  }

  async login(loginUserDto: LoginUserDto) {
    try {
      const user = await this.usersService.findOne(loginUserDto.id);

      if (!user) {
        throw new Error('Пользователь не найден');
      }

      const isPasswordValid = await bcrypt.compare(loginUserDto.password, user.password);

      if (!isPasswordValid) {
        throw new Error('Неверный пароль');
      }

      const payload = { username: user.username, sub: user.id };
      const token = this.jwtService.sign(payload);

      return { access_token: token };
    } catch (error) {
      throw new Error('Ошибка при логине: ' + error.message);
    }
  }
}
