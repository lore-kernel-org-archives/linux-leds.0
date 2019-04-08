From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [GIT PULL v2] LM3532 backlight support improvements and
 relocation
Date: Mon, 8 Apr 2019 10:42:23 -0500
Message-ID: <97e64469-4c09-ff6b-7bd4-c8f1580512e0@ti.com>
References: <20190407190951.27288-1-jacek.anaszewski@gmail.com>
 <20190407221740.GA6327@amd> <20190407225011.GA9120@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190407225011.GA9120@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh@kernel.org
Cc: lee.jones@linaro.org, tony@atomide.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi

On 4/7/19 5:50 PM, Pavel Machek wrote:
> Hi!
> 
>>> Changes since v1:
>>>
>>> - synchronized DT label properties in DT bindings with what has been agreed
>>>   for the patch "ARM: dts: omap4-droid4: Update backlight dt properties"
>>>
>>> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
>>>
>>>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>>>
>>> are available in the git repository at:
>>>
>>>   git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/lm3532-driver-improvements
>>>
>>> for you to fetch changes up to bc1b8492c764fea940fc66206047e37a7f8d77e1:
>>>
>>>   leds: lm3532: Introduce the lm3532 LED driver (2019-04-07 20:45:49 +0200)
>>>
>>> Thanks,
>>> Jacek Anaszewski
>>>
>>> ----------------------------------------------------------------
>>> LM3532 backlight driver improvements and relocation
>>> ----------------------------------------------------------------
>>> Dan Murphy (4):
>>>       dt: lm3532: Add lm3532 dt doc and update ti_lmu doc
>>
>> Sorry, this one will need more work.
>>
>> When did Rob acknowledge this? I do not remember that mail & quick
>> google does not find it.
> 
> Aha, found it now:
> 
> Date: Fri, 15 Mar 2019 18:35:01 -0500
> From: Rob Herring <robh@kernel.org>
> To: Dan Murphy <dmurphy@ti.com>
> Subject: Re: [PATCH v4 1/4] dt: lm3532: Add lm3532 dt doc and update ti_lmu doc
> 

For reference to all here is the Reviewed-by from Rob.

https://lore.kernel.org/patchwork/patch/1050412/

>  									Pavel
> 


-- 
------------------
Dan Murphy
