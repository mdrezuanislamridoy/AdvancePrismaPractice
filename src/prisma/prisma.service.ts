import { Injectable, OnModuleInit } from '@nestjs/common';
import { PrismaPg } from '@prisma/adapter-pg';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit {
  constructor() {
    const connectionString = `${process.env.DATABASE_URL!}`;
    const adapter = new PrismaPg({ connectionString });

    super({ adapter });
  }

  onModuleInit() {
    this.$connect()
      .then(() => console.log('Db connected'))
      .catch((e) => console.log(e));
  }
}
