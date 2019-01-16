From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v7 0/5] leds: trigger: Add pattern initialization from
 Device Tree
Date: Wed, 16 Jan 2019 22:19:11 +0100
Message-ID: <0d835201-41f0-6e74-8483-24ab62ab76d7@gmail.com>
References: <1547045089-19128-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547045089-19128-1-git-send-email-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Krzysztof.

On 1/9/19 3:44 PM, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes since v6:
> 1. Drop goto from led_get_default_pattern() and rename "DeviceTree"
>     into "device tree".
> 2. Add Pavel's ack to patch 1/5.
> 
> Changes since v5:
> 1. Drop the "classdev" prefix from helper for getting default pattern
>     and move the kerneldoc to header file (this was not fixed in v5 by
>     mistake).
> 
> Changes since v4:
> 1. Move helper to get default pattern from led-class.c to led-core.c and
>     rename it (build issue pointed by kbuild robot).
> 
> Changes since v3:
> 1. Add missing EXPORT_SYMBOL_GPL.
> 2. Put pattern trigger format into common file - shared between
>     dt-bindings and sysfs.
> 3. Use array of integers as led-pattern property (since it is bigger change
>     I did not add Pavel's ack to patch 2/5).
> 4. Mention ms units for led-pattern bindings.
> 
> Changes since v2:
> 1. Drop Jacek's patches and my "led: triggers: Initialize
>     LED_INIT_DEFAULT_TRIGGER if trigger is brought after class".
> 2. Follow Rob's advices about bindings - use "led-pattern" property
>     and generalize usage of it into to three triggers.
> 3. New patches (2/5, 4/5 and 5/5).
> 
> Changes since v1:
> 1. Rebase on Jacek's patches.
> 2. Add patch 3/5 for fixup of Jacek's solution.
> 3. Drop first two patches from the series (applied).
> 4. Patch 5/5: Use LED_INIT_DEFAULT_TRIGGER (suggested by Jacek Anaszewski).
> 5. Patch 5/5: Return-on-error and log warning (suggested by Pavel Machek).
> 
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (5):
>    dt-bindings: leds: Add pattern initialization from Device Tree
>    leds: Add helper for getting default pattern from Device Tree
>    leds: trigger: pattern: Add pattern initialization from Device Tree
>    leds: trigger: oneshot: Add initialization from Device Tree
>    leds: trigger: timer: Add initialization from Device Tree
> 
>   .../ABI/testing/sysfs-class-led-trigger-pattern    | 51 +----------
>   Documentation/devicetree/bindings/leds/common.txt  | 12 +++
>   .../bindings/leds/leds-trigger-pattern.txt         | 49 +++++++++++
>   drivers/leds/led-core.c                            | 30 +++++++
>   drivers/leds/trigger/ledtrig-oneshot.c             | 38 ++++++++-
>   drivers/leds/trigger/ledtrig-pattern.c             | 99 +++++++++++++++++-----
>   drivers/leds/trigger/ledtrig-timer.c               | 34 ++++++++
>   include/linux/leds.h                               | 13 +++
>   8 files changed, 257 insertions(+), 69 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt
> 

Patch set applied to the for-next branch of linux-leds.git.

Thank you for your effort.

-- 
Best regards,
Jacek Anaszewski
