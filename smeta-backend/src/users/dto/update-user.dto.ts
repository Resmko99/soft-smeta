import { ApiProperty } from '@nestjs/swagger';

export class UpdateUserDto {
  @ApiProperty({ description: 'Имя пользователя', example: 'john_doe_updated' })
  readonly username?: string;

  @ApiProperty({ description: 'Новый пароль', example: 'newpassword456' })
  readonly password?: string;
}