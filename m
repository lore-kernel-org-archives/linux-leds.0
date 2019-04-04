From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 4/4] leds: lm3532: Introduce the lm3532 LED driver
Date: Thu, 4 Apr 2019 14:23:34 -0500
Message-ID: <f278edc7-1614-0410-9aa7-2e3a6fc7818b@ti.com>
References: <20190321142838.22985-1-dmurphy@ti.com>
 <20190321142838.22985-4-dmurphy@ti.com> <20190404000909.GY49658@atomide.com>
 <f4c0a946-fd0f-0071-0039-cfaea2f27ccc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f4c0a946-fd0f-0071-0039-cfaea2f27ccc@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Tony Lindgren <tony@atomide.com>
Cc: robh+dt@kernel.org, pavel@ucw.cz, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
List-Id: linux-leds@vger.kernel.org

Tony

On 4/4/19 1:48 PM, Jacek Anaszewski wrote:
> Hi Tony,
> 
> Thanks for the feedback.
> 
> On 4/4/19 2:09 AM, Tony Lindgren wrote:
>> * Dan Murphy <dmurphy@ti.com> [190321 14:29]:
>>> Introduce the Texas Instruments LM3532 White LED driver.
>>> The driver supports ALS configurability or manual brightness
>>> control.
>>>
>>> The driver also supports associating LED strings with specific
>>> control banks in a group or as individually controlled strings.
>>
>> I'm seeing slightly different naming under /sys/class/leds:
>>
>> lm3532:backlight
>> lm3532:platform::kbd_backlight
> 
> The problem is in the "platform:" being a part of DT
> label property. It should not be included there if devicename
> section is added in the driver.
> 

Feel free to make it whatever you want I am not married to the naming convention for Droid 4.
It was a suggestion in the code review

https://lore.kernel.org/patchwork/patch/1048806/

<snip>



-- 
------------------
Dan Murphy
