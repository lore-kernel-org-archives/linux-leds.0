From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 4/4] leds: lm3532: Introduce the lm3532 LED driver
Date: Thu, 4 Apr 2019 20:48:38 +0200
Message-ID: <f4c0a946-fd0f-0071-0039-cfaea2f27ccc@gmail.com>
References: <20190321142838.22985-1-dmurphy@ti.com>
 <20190321142838.22985-4-dmurphy@ti.com> <20190404000909.GY49658@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404000909.GY49658@atomide.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, pavel@ucw.cz, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Tony,

Thanks for the feedback.

On 4/4/19 2:09 AM, Tony Lindgren wrote:
> * Dan Murphy <dmurphy@ti.com> [190321 14:29]:
>> Introduce the Texas Instruments LM3532 White LED driver.
>> The driver supports ALS configurability or manual brightness
>> control.
>>
>> The driver also supports associating LED strings with specific
>> control banks in a group or as individually controlled strings.
> 
> I'm seeing slightly different naming under /sys/class/leds:
> 
> lm3532:backlight
> lm3532:platform::kbd_backlight

The problem is in the "platform:" being a part of DT
label property. It should not be included there if devicename
section is added in the driver.

> 
> Not sure if this is correct with the the "platform" and
> "::" there for the kbd_backlight?
> 
> With the dts change I posted, I've tested this with
> linux-next and Sebastian's DSI command mode patches
> "[PATCHv6 0/4] omapdrm: DSI command mode panel support".
> 
> So feel free to add:
> 
> Tested-by: Tony Lindgren <tony@atomide.com>
> 

-- 
Best regards,
Jacek Anaszewski
