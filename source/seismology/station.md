# 地震台站

- 本节贡献者: {{ 姚家园 }}（作者）、{{何星辰}}（作者）、{{ 田冬冬 }}（审稿）
- 最近更新日期: 2025-10-02
- 预计花费时间: 30 分钟

---

## 数据记录和传输

地震学工作者在全球范围布设了许多地震仪，有的布设在地表，有的布设在地下。
有的地震仪配备了充电设备（如太阳能面板）、网络通讯设备，以便长期稳定地运行，并实时传输数据。

地震发生后，其激发的地震波会在地球内部传播。地震波传播至地震仪位置时，地震仪会随即将其记录下来，
并将其转换为数字记录，存储起来。配有蜂窝电话、宽带网络或卫星通信系统的台站，还可以将数据实时
传输到数据处理中心。最后，科研人员和大众可以利用互联网在数据中心下载数据，开展研究工作。

:::{figure} data-transimission.jpg
:align: center
:alt: 地震数据记录和传输示意图
:width: 95%

地震学数据地记录和传输示意图。引自
[How does a seismic station work?](http://www.usarray.org/public/about/how#anchor1)
:::

## 仪器响应

在地震学中，台站的地震记录 `u(t)` 是震源 `s(t)`、路径效应 `g(t)` 和仪器响应 `i(t)` 三者卷积的结果。

$$u(t) = s(t) * g(t) * i(t)$$

数据处理的核心目标就是精确地移除已知的仪器响应 `i(t)`，从而研究未知的震源 `s(t)` 和路径 `g(t)`。

### 构成与原理

仪器响应 `i(t)` 本质上是一个**带通滤波器**，它压制了如固体潮汐等超低频和城市噪声等高频干扰，从而凸显出地震信号。这个总响应由多个处理阶段累积而成：

  * **阶段1：模拟传感器（地震计）**

      * **功能**: 将地面运动（m/s）转换为模拟电压（V）。
      * **描述**: 通常由**零极点**（Poles and Zeros）定义。
      * **参数**: 灵敏度 $S_{d1}$ (单位: V/(m/s²))。

  * **阶段2：模数转换器（ADC）**

      * **功能**: 将模拟电压（V）转换为数字计数（counts）。
      * **描述**: 一个简单的增益因子。
      * **参数**: 灵敏度 $S_{d2}$ (单位: counts/V)。

  * **阶段3：数字信号处理（DSP）**

      * **功能**: 对数字信号进行滤波和降采样。
      * **描述**: 由一系列**滤波器系数**定义。
      * **参数**: 一个无量纲的增益 $S_{d3}$。

### 灵敏度计算与应用

仪器的**总灵敏度**是所有阶段灵敏度的乘积，它表示了从地面运动到最终数字输出的转换系数。

* **计算公式**:
    $$S_{d(\text{总})} = S_{d1} \times S_{d2} \times S_{d3} \times \dots$$

* **实际应用**:
    为了得到真实的地面运动，需要执行**反褶积**（去仪器响应）。该过程在频率域中通过除法实现。为避免恢复低频和高频噪声，操作时须应用带通滤波器。

    其数学表达式为：
    $$M(\omega) = \frac{U(\omega)}{I(\omega)} \cdot B(\omega)$$

    其中：
    * $U(\omega)$ 是观测记录 $u(t)$ 的傅里叶变换。
    * $I(\omega)$ 是仪器响应 $i(t)$ 的傅里叶变换。
    * $B(\omega)$ 是一个带通滤波器。
    * $M(\omega)$ 是我们最终得到的、在目标频段内的地面运动的频谱。

    最后，通过傅里叶逆变换，即可得到时间域内的真实地面运动波形 $m(t)$。

### References

- https://blog.seisman.info/instrumental-response/
- https://blog.seisman.info/instrumental-response-physical-details/
- https://blog.seisman.info/instrumental-response-resp/
- https://blog.seisman.info/instrumental-response-sacpz/
- https://blog.seisman.info/resp-sacpz-difference/
- https://blog.seisman.info/instrumental-response-details/
- http://docs.fdsn.org/projects/stationxml/en/latest/response.html


## 台站命名

1. ID：NET.STA.LOC.CHN
2. 解释 NET、STA、LOC、CHN 的层级关系
3. 解释channel，如 BHZ
