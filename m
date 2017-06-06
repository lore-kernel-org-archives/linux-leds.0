From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH V2 1/2] leds: leds-qti-rgb: Add LED driver for QTI TRI_LED
 module
Date: Tue, 6 Jun 2017 22:07:18 +0200
Message-ID: <e4efce59-f611-14e5-1d11-09cb660585b2@gmail.com>
References: <20170601072723.12760-1-fenglinw@codeaurora.org>
 <8058ed85-5a64-8dc3-99ea-1ad8128e043d@gmail.com> <20170605211609.GA9035@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170605211609.GA9035@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: fenglinw@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, subbaram@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: linux-leds@vger.kernel.org

Hi,

On 06/05/2017 11:16 PM, Pavel Machek wrote:
> Hi!
> 
>> Generally I came to a conclusion that it will be best to register
>> additional LED RGB class device in an addition to three LED class
>> devices representing each color. In order to avoid hard to solve
>> locking problems I propose to allow for simultaneous access to LED
>> class devices and LED RGB class device gathering them.
>>
>> All in all, currently we also don't give an exclusive access to
>> a particular LED class device, which always can lead to overwriting
>> current brightness by another process. These issues must be arbitrated
>> by user space.
>>
>> I propose that LED RGB class device exposed following files:
>>
>> - red_brightness
>> - green_brightness
>> - blue_brightness
>> - latch_color
> 
> Actually, I'd just do single file, "rgb_brightness" with 3
> values. Overhead of writing 3 values is pretty much 0.

You've always been strongly in favor of one-value-per-file
sysfs rule of thumb, but I'm OK with this approach as well :-)

-- 
Best regards,
Jacek Anaszewski
