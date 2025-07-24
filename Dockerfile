# استخدم نسخة Node.js مناسبة
FROM node:18

# مجلد العمل داخل الحاوية
WORKDIR /app

# انسخ ملفات تعريف الحزم فقط (لتسريع التثبيت)
COPY package*.json ./

# ثبت الحزم مع تخطي مشاكل peer dependencies
RUN npm install --legacy-peer-deps

# انسخ باقي ملفات المشروع
COPY . .

# بناء المشروع (لو تستخدم NestJS)
RUN npm run build

# أمر تشغيل التطبيق
CMD ["npm", "run", "start:prod"]
