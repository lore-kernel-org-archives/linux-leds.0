From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 0/5] leds: trigger: Add pattern initialization from
 Device Tree
Date: Mon, 10 Dec 2018 22:03:18 +0100
Message-ID: <be526095-5af9-38bb-7c72-629a82d318e0@gmail.com>
References: <1544434201-14190-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544434201-14190-1-git-send-email-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Krzysztof,

Thank you for the update.

On 12/10/18 10:29 AM, Krzysztof Kozlowski wrote:
> Hi,
> 
> I rebased on top of Jacek's patches and, as I could not find them on git kernel
> tree, I included them here. Also with small fixup.
> 
> Changes since v1:
> 1. Rebase on Jacek's patches.

Made following amendments to 2/5:

- removed extra empty line
- fixed language in the commit message as proposed by Pavel

> 2. Add patch 3/5 for fixup of Jacek's solution.
> 3. Drop first two patches from the series (applied).
> 4. Patch 5/5: Use LED_INIT_DEFAULT_TRIGGER (suggested by Jacek Anaszewski).
> 5. Patch 5/5: Return-on-error and log warning (suggested by Pavel Machek)
Applied to the for-next branch of linux-leds.git, thanks.

Pavel - I'm still awaiting your acks, just wanted to have
the patch set in linux-next quicker, taking into account that
merge window is imminent.

Best regards,
Jacek Anaszewski

> Jacek Anaszewski (2):
>    led: triggers: Break the for loop after default trigger is found
>    led: triggers: Add LED_INIT_DEFAULT_TRIGGER flag
> 
> Krzysztof Kozlowski (3):
>    led: triggers: Initialize LED_INIT_DEFAULT_TRIGGER if trigger is
>      brought after class
>    dt-bindings: leds: Add pattern initialization from Device Tree
>    leds: trigger: Add pattern initialization from Device Tree
> 
>   Documentation/devicetree/bindings/leds/common.txt |  7 +++++
>   drivers/leds/led-triggers.c                       | 10 +++++--
>   drivers/leds/trigger/ledtrig-pattern.c            | 32 +++++++++++++++++++++++
>   include/linux/leds.h                              |  1 +
>   4 files changed, 48 insertions(+), 2 deletions(-)
> 
