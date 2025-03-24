import { ApiProperty } from '@nestjs/swagger';

export class LoginUserDto {

  @ApiProperty({ description: 'id', example: '1' })
  readonly id: number;
    
  @ApiProperty({ description: 'Имя пользователя', example: 'john_doe' })
  readonly username: string;

  @ApiProperty({ description: 'Пароль пользователя', example: 'password123' })
  readonly password: string;
}