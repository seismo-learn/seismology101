// 页面元信息指令：统一渲染作者、更新日期与预计阅读时间。
//
// 用法：
//
//   :::{page-meta}
//   :authors: 田冬冬、姚家园
//   :updated: 2026-06-11
//   :reading-time: 5 分钟
//   :::
//
// 图标、字段顺序、分隔线均在此处统一定义，改动后全站同步生效。

const pageMeta = {
  name: 'page-meta',
  doc: '页面元信息：作者、最近更新日期、预计阅读时间。',
  options: {
    authors: { type: String, doc: '本节作者，多人以顿号分隔' },
    updated: { type: String, doc: '最近更新日期，格式为 YYYY-MM-DD' },
    'reading-time': { type: String, doc: '预计阅读时间，如「20 分钟」' },
  },
  run(data) {
    const options = data.options ?? {};
    const fields = [
      ['✍️', options.authors],
      ['📅', options.updated],
      ['⏱️', options['reading-time']],
    ];
    const items = fields
      .filter(([, value]) => value)
      .map(([icon, value]) => ({
        type: 'span',
        class: 'page-meta-item',
        children: [{ type: 'text', value: `${icon} ${value}` }],
      }));
    if (items.length === 0) return [];
    return [
      {
        type: 'div',
        class: 'page-meta',
        children: [{ type: 'paragraph', children: items }],
      },
      // 元信息与正文之间的分隔线，由指令统一输出，正文无需手写 `---`
      { type: 'thematicBreak' },
    ];
  },
};

const plugin = { name: 'Page meta', directives: [pageMeta] };

export default plugin;
