From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v4 5/7] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3633
Date: Thu, 25 Oct 2018 13:01:52 -0500
Message-ID: <57f73b8f-3eab-642d-5b4e-c7c6c890006b@ti.com>
References: <20181023170623.31820-1-dmurphy@ti.com>
 <20181023170623.31820-5-dmurphy@ti.com> <20181024092328.GD24997@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024092328.GD24997@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, lee.jones@linaro.org, tony@atomide.com
List-Id: linux-leds@vger.kernel.org

Pavel

On 10/24/2018 04:23 AM, Pavel Machek wrote:
> On Tue 2018-10-23 12:06:21, Dan Murphy wrote:
>> The LM3633 is a single function LED driver. The single function LED
>> driver needs to reside in the LED directory as a dedicated LED driver
>> and not as a MFD device.  The device does have common brightness and ramp
>> features and those can be accomodated by a TI LMU framework.
>>
>> The LM3633 dt binding needs to be moved from the ti-lmu.txt and a dedicated
>> LED dt binding needs to be added.  The new LM3633 LED dt binding will then
>> reside in the Documentation/devicetree/bindings/leds directory and follow the
>> current LED and general bindings guidelines.
> 
> What?
> 
>>  .../devicetree/bindings/leds/leds-lm3633.txt  | 102 ++++++++++++++++++
>>  .../devicetree/bindings/mfd/ti-lmu.txt        |  48 ---------
>>  2 files changed, 102 insertions(+), 48 deletions(-)
>>  create mode 100644
>>  Documentation/devicetree/bindings/leds/leds-lm3633.txt
> 
>> index 920f910be4e9..573e88578d3d 100644
>> --- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
>> +++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
>> @@ -7,7 +7,6 @@ TI LMU driver supports lighting devices below.
>>    LM3532       Backlight
>>    LM3631       Backlight and regulator
>>    LM3632       Backlight and regulator
>> -  LM3633       Backlight, LED and fault monitor
>>    LM3695       Backlight
> 
> Are you seriously proposing to take one binding and split it into 6
> copy&pasted ones?

No that is not what I am proposing.  And never have.  I support keeping the MFD
devices in the MFD directory and only pulling out the single function devices as we have
debated over and over again.

> 
> That's not the way we do development. NAK.
> 
> We don't want to have copy & pasted code. We also don't want to have
> copy & pasted bindings. Nor changelogs, for that matter.
> 

Change was copy and pasted don't know why I need to rephrase the same exact
change only for a different part but I can modify it.

I do see what I can update here.  As you said I will fix up the ti-lmu binding in
such a way that the dedicated LED driver bindings point to the common binding for the TI-LMU
framework.

Dan

> Thank you,
> 								Pavel
> 


-- 
------------------
Dan Murphy
