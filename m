From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Date: Mon, 4 Mar 2019 13:14:04 -0600
Message-ID: <46624fe6-c767-1872-c8c0-06cbf9a59e05@ti.com>
References: <20181023170623.31820-1-dmurphy@ti.com>
 <20181023170623.31820-2-dmurphy@ti.com> <20181024090421.GB24997@amd>
 <e8800c2e-8ada-7a0d-c1a6-14ddcbe1576d@ti.com> <20181024145434.GC9327@bogus>
 <beb1a6e1-8120-be94-b1a4-60ea6721765d@ti.com>
 <ade3121a-58ab-c0c3-6605-cf7d6a638da0@gmail.com> <20181026083703.GB19434@amd>
 <bdb73aa2-60d9-3356-f934-091f738e20a0@ti.com> <20190302230725.GA9225@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190302230725.GA9225@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, lee.jones@linaro.org, tony@atomide.com
List-Id: linux-leds@vger.kernel.org

Pavel

On 3/2/19 5:07 PM, Pavel Machek wrote:
> Hi!
> 
>> I just want to follow up here and let you know that I have not abandoned this.
>> I am trying to rework and fix up the ti lmu binding as asked by Pavel.  Its proving
>> to be a bit of a challenge based on looking forward to what will be the implementation.
>>
>> I also did go offline and speak with Tony.  I have a Droid 4 so I can test all of this on
>> production hardware as well.
>>
>> Updated patchset will take some time to get out.
> 
> Is there any progress here?
> 
> This is needed for display on Droid 4, so it is somehow
> important... and Milo Kim's patches are pretty reasonable.
> 
> I still believe best way forward is to merge them, and let you submit
> any improvements on top of them...
> 

I had looked at this a while back.  And I will pick this up again as it seems that the
multi color framework will take longer than expected.

For the Droid 4 it uses the lm3552 backlight driver, at least that is what is in the DT.

There is a lm3530 backlight driver that is already available and could be upgraded to DT support and have the lm3552
added to it but the issues are the 3532 has 3 outputs and the 3530 has 1 and the register map is a bit different.

There are register differences between the two devices but the driver already has ramp support, PWM support (exponential/linear),
ALS support and manual support already available along with user space configuration.

I was working on creating a new lm3532 driver based off the lm3530 driver or adapting the 3530 to include the 3532 and
making the driver generic to this family.

Dan

> Best regards,
> 									Pavel
> 


-- 
------------------
Dan Murphy
