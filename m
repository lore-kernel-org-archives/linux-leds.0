From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 3/4] leds: Add LED support for MT6323 PMIC
Date: Thu, 9 Feb 2017 21:35:26 +0100
Message-ID: <39b1c6ec-408c-bb92-f937-d477afa626a5@gmail.com>
References: <1486520357-13096-1-git-send-email-sean.wang@mediatek.com>
 <1486520357-13096-4-git-send-email-sean.wang@mediatek.com>
 <a410da2e-ce5f-6263-2d7d-79f4b358a848@gmail.com>
 <20170209142344.GA23373@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170209142344.GA23373@xo-6d-61-c0.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: sean.wang@mediatek.com, rpurdie@rpsys.net, lee.jones@linaro.org, matthias.bgg@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, keyhaede@gmail.com
List-Id: linux-leds@vger.kernel.org

On 02/09/2017 03:23 PM, Pavel Machek wrote:
> Hi!
> 
>>> +/*
>>> + * Register for MT6323_ISINK_CON0 to setup the
>>> + * duty cycle of the blink
>>> + */
>>> +#define MT6323_ISINK_CON0(i)		(MT6323_ISINK0_CON0 + 0x8 * (i))
>>> +#define MT6323_ISINK_DIM_DUTY_MASK	(0x1f << 8)
>>> +#define MT6323_ISINK_DIM_DUTY(i)	(((i) << 8) & \
>>> +					MT6323_ISINK_DIM_DUTY_MASK)
>>> +
>>> +/*
>>> + * Register to setup the period of the blink
>>> + */
>>
>> This fits in a single line, so can be wrapped with /* */ like :
> 
> People do this to make blocks stand out, and to make it similar to other blocks
> above. I believe this is ok.

It generates unnecessary lines of code, but I'm not going to
argue, let's leave it to the developer's taste.

-- 
Best regards,
Jacek Anaszewski
