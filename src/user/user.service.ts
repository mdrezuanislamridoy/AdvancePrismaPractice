import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class UserService {
  constructor(private prismaService: PrismaService) {}
  async create(createUserDto: CreateUserDto) {
    const res = await this.prismaService.user.create({
      data: {
        ...createUserDto,
      },
    });
    // eslint-disable-next-line @typescript-eslint/no-unsafe-return
    return res;
  }

  findAll() {
    return `This action returns all user`;
  }

  async findOne(id: number) {
    // eslint-disable-next-line @typescript-eslint/no-unsafe-return
    return await this.prismaService.user.findUnique({
      where: {
        id: id,
      },
    });
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
