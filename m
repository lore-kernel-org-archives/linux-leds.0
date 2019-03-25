From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 4/4] leds: lm3532: Introduce the lm3532 LED driver
Date: Mon, 25 Mar 2019 07:35:38 -0500
Message-ID: <dc24b66c-658e-41aa-c869-42c4a7e812a8@ti.com>
References: <20190321142838.22985-1-dmurphy@ti.com>
 <20190321142838.22985-4-dmurphy@ti.com> <20190322221654.GG19425@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322221654.GG19425@atomide.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
List-Id: linux-leds@vger.kernel.org

Tony

On 3/22/19 5:16 PM, Tony Lindgren wrote:
> Hi,
> 
> * Dan Murphy <dmurphy@ti.com> [190321 14:29]:
>> Introduce the Texas Instruments LM3532 White LED driver.
>> The driver supports ALS configurability or manual brightness
>> control.
>>
>> The driver also supports associating LED strings with specific
>> control banks in a group or as individually controlled strings.
> 
> Thanks for getting this driver done. I need help a bit using
> this though.. What's the glue to the drm driver?
> 
> I can control the backlight brightness just fine via /sys, and
> backlight shows up as the trigger in /sys/class/leds/lm3532:backlight,
> but /sys/class/backlight is empty and looks like drm can't find it.
> 
> Do I need to enable some additional driver(s) to get this to work
> with the drm driver?
> 

Can you dump or point to the defconfig?

Dan

> Regards,
> 
> Tony
> 


-- 
------------------
Dan Murphy
