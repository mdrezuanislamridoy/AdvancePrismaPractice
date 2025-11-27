import { IsEmail, IsNotEmpty, IsString, MinLength } from 'class-validator';

export class LoginDto {
  @IsEmail({}, { message: 'Value must be a valid email' })
  @IsNotEmpty({ message: 'Value cannot be empty' })
  email: string;

  @IsString({ message: 'Value must be a string' })
  @IsNotEmpty({ message: 'Value cannot be empty' })
  @MinLength(6, { message: 'Min length must me at elast 6 character' })
  password: string;
}
