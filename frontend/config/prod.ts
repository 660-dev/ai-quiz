import type { UserConfigExport } from '@tarojs/cli'

export default {
  defineConstants: {
    // 本地演示：指向本机后端。正式上线时改回 https://ai-learn.codefather.cn/api/v1
    API_BASE_URL: '"http://localhost:8000/api/v1"',
  },
  mini: {},
  h5: {},
} satisfies UserConfigExport<'webpack5'>
