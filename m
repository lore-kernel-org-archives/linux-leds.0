From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v4 1/7] leds: add TI LMU backlight driver
Date: Wed, 24 Oct 2018 07:27:57 -0500
Message-ID: <4afc7944-d6f1-fef1-1ae4-f761e050fec9@ti.com>
References: <20181023170623.31820-1-dmurphy@ti.com>
 <20181024091407.GC24997@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024091407.GC24997@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, lee.jones@linaro.org, tony@atomide.com, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-leds@vger.kernel.org

Pavel

On 10/24/2018 04:14 AM, Pavel Machek wrote:
> On Tue 2018-10-23 12:06:17, Dan Murphy wrote:
>> From: Pavel Machek <pavel@ucw.cz>
>>
>> This adds backlight support for the following TI LMU
>> chips: LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697.
>>
>> It controls LEDs on Droid 4
>> smartphone, including keyboard and screen backlights.
>>
>> Signed-off-by: Milo Kim <milo.kim@ti.com>
>> [add LED subsystem support for keyboard backlight and rework DT
>> binding according to Rob Herrings feedback]
>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
>> [remove backlight subsystem support for now]
>> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> This is not correct way to sign off a patch.
> 
> What is worse, this is very different from patch I submitted; this
> misses imporant parts while my patch was complete.
> 
> I already submitted better patch for both the driver and device tree
> bindings. Can we go back and apply that?
> 
> Then you can add your changes on top of that, if they actually make
> the situation better.

Thanks for this.  I wanted to make sure not to loose any authorship or credit
in the commit.  Actually removing Milo might help stop getting the bounce back
from the mail daemon.

I was using the RFC patch as my base https://lore.kernel.org/patchwork/patch/978995/

Which contains this sign off.

Dan

> 
> Thanks,
> 								Pavel
> 


-- 
------------------
Dan Murphy
