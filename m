From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 0/2] Panasonic AN30259A support
Date: Mon, 10 Sep 2018 21:33:53 +0200
Message-ID: <3bafc642-db6c-e872-cca5-8f654f38224a@gmail.com>
References: <20180909103826.17793-1-simon@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180909103826.17793-1-simon@lineageos.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Shields <simon@lineageos.org>, linux-leds@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Simon,

Thank you for the updated set.

On 09/09/2018 12:38 PM, Simon Shields wrote:
> Hi,
> 
> This patch series adds DT bindings (patch #1) and the corresponding driver
> (patch #2) for the Panasonic AN30259A 3-channel LED driver. AN30259A
> uses an internal clock for controlling brightness/on-off cycles, but
> also supports using an external PWM/clock input. This patch series only
> implements support for the former.
> 
> The AN30259A is connected using I2C, and the datasheet is freely
> available[0].
> 
> Changes since v4 (mistakenly sent as v3):
> * Rebased on v4.19-rc2
> * Namespace all macros with AN30259A_ prefix
> * Fix trivial compiler/checkpatch --strict warnings
> 
> Changes since v3:
> * Rebased on v4.18-rc3.
> * Drop unnecessary DUTYMAX/MID calculations when blinking:
>  previously I'd thought that the PWM duty values were expressed
>  as a percentage of the maximum current output, but in reality
>  they're a percentage of the current set in the LEDxCC registers.
> This simplifies the code quite a bit.
> * Corrected MODULE_LICENSE declaration.
> * Return -EINVAL from set_blink if the blink rate is unsupported in
>  hardware.
> * Fix more checkpatch --strict issues.
> 
> Changes since v2:
> * Drop "an30259a:" prefix from bindings and add it in the device driver
>  instead.
> * Use led-controller instead of leds for sample DT binding.
> * Use ":indicator" instead of ":notification" in sample DT binding.
> * Merge an30259a_led_set and an30259a_brightness to
>  an30259a_brightness_set (and same for blink functions).
> * Explain the range limitations of the AN30259A's sloping mode
>  in the code - the AN30259A only has a 7-bit PWM range in slope mode,
>  and the bottom 3 bits are always set.
> 
> Changes since v1:
> * Documentation formatting/grammar fixes.
> * Use reg property instead of led-sources for leds.
> * Add default-state support.
> * Fix auto-probing when built as a module.
> * Simplified DT parsing code.
> * Use devm version of led_class_register().
> * Fix LED naming scheme.
> * Fixed checkpatch --strict issues.
> 
> Cheers,
> Simon
> 
> [0]: https://www.alliedelec.com/m/d/a9d2b3ee87c2d1a535a41dd747b1c247.pdf
> 
> Simon Shields (2):
>   dt-bindings: leds: document Panasonic AN30259A bindings
>   leds: add Panasonic AN30259A support
> 
>  .../bindings/leds/leds-an30259a.txt           |  43 ++
>  drivers/leds/Kconfig                          |  10 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/leds-an30259a.c                  | 368 ++++++++++++++++++
>  4 files changed, 422 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-an30259a.txt
>  create mode 100644 drivers/leds/leds-an30259a.c
> 

Applied to the for-next branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
