From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 0/5] TI LMU rework
Date: Wed, 3 Apr 2019 22:14:28 +0200
Message-ID: <1f24fe22-7265-df4b-872a-cfb3622002c9@gmail.com>
References: <20190325142403.30447-1-dmurphy@ti.com>
 <1037091e-1f4a-3922-16ee-282253dad7e0@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1037091e-1f4a-3922-16ee-282253dad7e0@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: linux-leds@vger.kernel.org

Hi Dan,

On 4/3/19 2:02 PM, Dan Murphy wrote:
> Hello
> 
> On 3/25/19 9:23 AM, Dan Murphy wrote:
>> All
>>
>> I know that it has been a long time but I put some additional effort into this
>> code.  The TI LMU common code right now handles brightness and ramp up/down
>> setting for the LM3697.  This so far are the common features I could find.
>>
>> The LM3697 driver has the ability to assign HVLED strings to specific control
>> banks as well as assigning different max brightnesses to these strings.
>>
>> Fault monitoring was removed as the data sheet indicates that this is for
>> production tests only.
>>
>> I have plans to add additional LED drivers to use the TI LMU but I figured trying
>> to add all of them at once would be a daunting review and probably wrought with
>> problems.
>>
> 
> I have a new device I need to add to the TI LMU code LM36274.
> This will use the MFD ti-lmu code and I will need to create the backlight and regulator drivers.
> 
> I need to know how to proceed.  I can base the work off of the LM3532 patchset or use what is in mainline
> or base it off this patchset.  The LM36274 would use the ti-lmu-led-common code for brightness setting but the
> ramping times are different.
> 
> Please let me know how to proceed.

The patch set looks good to me with a single reservation I've just
posted. You can base your work off it.

-- 
Best regards,
Jacek Anaszewski
