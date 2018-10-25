From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Date: Thu, 25 Oct 2018 13:07:25 -0500
Message-ID: <beb1a6e1-8120-be94-b1a4-60ea6721765d@ti.com>
References: <20181023170623.31820-1-dmurphy@ti.com>
 <20181023170623.31820-2-dmurphy@ti.com> <20181024090421.GB24997@amd>
 <e8800c2e-8ada-7a0d-c1a6-14ddcbe1576d@ti.com> <20181024145434.GC9327@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024145434.GC9327@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, lee.jones@linaro.org, tony@atomide.com
List-Id: linux-leds@vger.kernel.org

Rob

On 10/24/2018 09:54 AM, Rob Herring wrote:
> On Wed, Oct 24, 2018 at 07:07:57AM -0500, Dan Murphy wrote:
>> Pavel
>>
>> On 10/24/2018 04:04 AM, Pavel Machek wrote:
>>> Hi!
>>>
>>>> The LM3697 is a single function LED driver. The single function LED
>>>> driver needs to reside in the LED directory as a dedicated LED driver
>>>> and not as a MFD device.  The device does have common brightness and ramp
>>>
>>> So it is single function LED driver. That does not mean it can not
>>> share bindings with the rest. Where the bindings live is not imporant.
>>>
>>
>> It can share bindings that are correctly done, not ones that are incomplete and incorrect.
>>
>> Where bindings live is important to new Linux kernel developers and product 
>> developers looking for the proper documentation on the H/W bindings.
>>
>>>> reside in the Documentation/devicetree/bindings/leds directory and follow the
>>>> current LED and general bindings guidelines.
>>>
>>> What you forgot to tell us in the changelog:
>>
>> I can add this to the changelog.
>>
>>>
>>>> +Optional child properties:
>>>> +	- runtime-ramp-up-msec: Current ramping from one brightness level to
>>>> +				the a higher brightness level.
>>>> +				Range from 2048 us - 117.44 s
>>>
>>> The other binding uses "ramp-up-msec". Tell us why you are changing this, or
>>> better don't change things needlessly.
>>>
>>> We don't want to be using "runtime-ramp-up-msec" for one device and
>>> "ramp-up-msec" for the other.
>>
>> This is another example of how the original bindings were incorrect and misleading.
>>
>> The LM3697 have 2 ramp implementations that can be used.
>>
>> Startup/Shutdown ramp and Runtime Ramp.  Same Ramp rates different registers and
>> different end user experience.
>>
>> So having a single node call ramp-up-msec is misleading and it does not
>> indicate what the H/W will do.
> 
> The existing ones aren't documented (present in the example is not 
> documented). This seems like something that should be common rather than 
> TI specific. Though it also seems more like something the user would 
> want to control (i.e. sysfs) rather than fixed in DT.
> 

Changing the runtime ramping or startup/shutdown ramping could also be done via sysfs.
I am not dedicated to having it in the DT file I was following prior art.

Jacek

Do you have an opinion on this?

Dan

> Rob
> 


-- 
------------------
Dan Murphy
