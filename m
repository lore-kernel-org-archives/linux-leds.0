From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v12 1/2] leds: core: Introduce LED pattern trigger
Date: Fri, 21 Sep 2018 11:31:26 +0800
Message-ID: <CAMz4kuJx9twJ=wM5qsucV3JH_VS-AC1aWMqpQOwAMkCuKBHLRg@mail.gmail.com>
References: <67ebebf02edd6d8ee42a13b139733e9cc680ea86.1536631975.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <67ebebf02edd6d8ee42a13b139733e9cc680ea86.1536631975.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Baolin Wang <baolin.wang@linaro.org>, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Jacek and Pavel,

On 11 September 2018 at 10:47, Baolin Wang <baolin.wang@linaro.org> wrote:
> This patch adds one new led trigger that LED device can configure
> the software or hardware pattern and trigger it.
>
> Consumers can write 'pattern' file to enable the software pattern
> which alters the brightness for the specified duration with one
> software timer.
>
> Moreover consumers can write 'hw_pattern' file to enable the hardware
> pattern for some LED controllers which can autonomously control
> brightness over time, according to some preprogrammed hardware
> patterns.
>
> Signed-off-by: Raphael Teysseyre <rteysseyre@gmail.com>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes from v11:
>  - Change -1 means repeat indefinitely.
>
> Changes from v10:
>  - Change 'int' to 'u32' for delta_t field.
>
> Changes from v9:
>  - None.
>
> Changes from v8:
>  - None.
>
> Changes from v7:
>  - Move the SC27XX hardware patterns description into its own ABI file.
>
> Changes from v6:
>  - Improve commit message.
>  - Optimize the description of the hw_pattern file.
>  - Simplify some logics.
>
> Changes from v5:
>  - Add one 'hw_pattern' file for hardware patterns.
>
> Changes from v4:
>  - Change the repeat file to return the originally written number.
>  - Improve comments.
>  - Fix some build warnings.
>
> Changes from v3:
>  - Reset pattern number to 0 if user provides incorrect pattern string.
>  - Support one pattern.
>
> Changes from v2:
>  - Remove hardware_pattern boolen.
>  - Chnage the pattern string format.
>
> Changes from v1:
>  - Use ATTRIBUTE_GROUPS() to define attributes.
>  - Introduce hardware_pattern flag to determine if software pattern
>  or hardware pattern.
>  - Re-implement pattern_trig_store_pattern() function.
>  - Remove pattern_get() interface.
>  - Improve comments.
>  - Other small optimization.
> ---

Do you have any comments for the v12 patch set? Thanks.

-- 
Baolin Wang
Best Regards
