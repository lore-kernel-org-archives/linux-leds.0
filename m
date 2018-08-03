From: kgunda@codeaurora.org
Subject: Re: [PATCH V4 0/8] backlight: qcom-wled: Support for QCOM wled driver
Date: Fri, 03 Aug 2018 12:49:34 +0530
Message-ID: <519913ec490934931b1c0b3a4539c283@codeaurora.org>
References: <1531131741-19971-1-git-send-email-kgunda@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531131741-19971-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Bjorn,
Can you please help review this patch series ?

Pavel, Rob, Daniel reviewed the series except the "auto string 
detection" patch.

Thanks,
Kiran

On 2018-07-09 15:52, Kiran Gunda wrote:
> This patch series renames the pm8941-wled.c driver to qcom-wled.c to 
> add
> the support for multiple PMICs supported by qualcomm. This patch series
> supports both PM8941 and PMI8998 WLED. The PMI8998 WLED has the support
> to handle the OVP (over voltage protection) and the SC (short circuit
> protection)
> interrupts. It also has the auto string detection algorithm support to
> configure the right strings if the user specified string configuration
> is in-correct. These three features are added in this series for 
> PMI8998.
> 
> changes from v1:
>    - Fixed the commit message for
>    - backlight: qcom-wled: Rename pm8941-wled.c to qcom-wled.c
> 
> Changes from v2:
>    - Fixed bjorn and other reviewer's comments
>    - Seperated the device tree bindings
>    - Splitted out the WLED4 changes in seperate patch
>    - Merged OVP and auto string detection patch
> 
> Changes from v3:
>   - Added Reviewed-by/Acked-by tags
>   - Fixed comments from Bjorn/Vinod/Rob
>   - Splitting the "backlight: qcom-wled: Add support for WLED4 
> peripheral" patch
>     to seperate the WLED3 specific restructure.
> 
> Kiran Gunda (8):
>   backlight: qcom-wled: Rename pm8941-wled.c to qcom-wled.c
>   backlight: qcom-wled: restructure the qcom-wled bindings
>   backlight: qcom-wled: Add new properties for PMI8998
>   backlight: qcom-wled: Rename PM8941* to WLED3
>   backlight: qcom-wled: Restructure the driver for WLED3
>   backlight: qcom-wled: Add support for WLED4 peripheral
>   backlight: qcom-wled: add support for short circuit handling
>   backlight: qcom-wled: Add auto string detection logic
> 
>  .../bindings/leds/backlight/pm8941-wled.txt        |   42 -
>  .../bindings/leds/backlight/qcom-wled.txt          |  150 +++
>  drivers/video/backlight/Kconfig                    |    8 +-
>  drivers/video/backlight/Makefile                   |    2 +-
>  drivers/video/backlight/pm8941-wled.c              |  432 -------
>  drivers/video/backlight/qcom-wled.c                | 1298 
> ++++++++++++++++++++
>  6 files changed, 1453 insertions(+), 479 deletions(-)
>  delete mode 100644
> Documentation/devicetree/bindings/leds/backlight/pm8941-wled.txt
>  create mode 100644
> Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>  delete mode 100644 drivers/video/backlight/pm8941-wled.c
>  create mode 100644 drivers/video/backlight/qcom-wled.c
