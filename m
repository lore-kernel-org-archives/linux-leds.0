From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: leds: Add bindings for lm3697 driver
Date: Tue, 11 Sep 2018 16:05:40 -0500
Message-ID: <ff9f932f-a9ae-b4fd-54d0-60be549534cb@ti.com>
References: <20180906135005.6718-1-dmurphy@ti.com>
 <20180906211617.GB16899@amd> <b8ac9d52-f16d-5fc4-0e9a-9246b9f984c5@ti.com>
 <20180907133228.GA16297@amd> <70f7506c-6a3d-3830-59a4-a246dc6163f7@ti.com>
 <226b8770-7041-39a4-5a06-6002a7c1225f@gmail.com>
 <20a814ce-a4c5-0649-6677-6b85a5fd2321@ti.com>
 <59561e0f-e3b9-7898-a300-90b198ad14e6@gmail.com>
 <20d9ea9e-bbb8-2240-97cc-615e3fbcef8c@ti.com> <20180911205504.GA31219@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180911205504.GA31219@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 09/11/2018 03:55 PM, Pavel Machek wrote:
> Hi!
> 
>>>>>>>> And I think Jacek pointed out that the bindings references in this bindings
>>>>>>>> don't even exist.
>>>>>>>>
>>>>>>>> I am thinking we need to deprecate this MFD driver and consolidate these drivers
>>>>>>>> in the LED directory as we indicated before.  I did not find any ti-lmu support
>>>>>>>> code.
>>>>>>>>
>>>>>>>> ti-lmu common core code and then the LED children appending the feature differentiation.
>>>>>>>
>>>>>>>> Need some maintainer weigh in here.
>>>>>>>
>>>>>>> Hehe. I'm maintnainer. Fun.
>>>>>>
>>>>>> I know.  I want to see if there was any other opinion.  Especially for the LED driver.
>>>>>>
>>>>> [...]
>>>>>
>>>>> I have a question - is this lm3697 LED controller a cell of some MFD
>>>>> device? Or is it a self-contained chip?
>>>>>
>>>>
>>>> This is a self contained chip.  And the LM3697 only function is a LED driver.
>>>> It does not have any other special functions like the LM363X drivers for GPIO and Regulator support.
>>>
>>> This is an argument for merging it as a standalone LED class driver
>>> then. It is even more justifiable, taking into account uncertainties
>>> related to the proper way of adding the support for it to the existing
>>> MFD driver, whereas the code reuse would be the only advantage of having
>>> thus support in MFD subsystem.
>>
>> Does the argument carry over to the other devices?
> 
> We really need something reasonable, that works for stand-alone LEDs,
> and also works for LEDs that are part of MFD when the hardware is similar.

I agree that LED drivers that have other functional blocks beyond driving a LED
chain belongs in the MFD space.  The amount of code that is similar is very small.

And like I pointed out Droid 4 may be only one use case where it makes sense to combine
all the LED code into a central place.  But most customers will just want a LED specific
driver to maintain.

> 
>> Like the LM3632 (part of the ti-lmu) has flash and torch and no other special functions
>> so it would look like the lm3601x family with different register mappings.
>>
>> The LM3631 seems to also be just a LED driver with no extra functionality
>>
>> I could go buy an EVM and put together a driver for that device as well using the lm3601x as
>> reference.
> 
> I do have hardware with lm3532. I can test patches, and I guess I can
> port driver easily if it is obvious how to do that.


I can get the LM3532 EVM.  I wrote a similar driver for the original Droid 10 years ago.
Upstreaming was not a priority for that company.

Here is a reference to the LM3530 code from back in the day on Google OMAP kernel.
https://android.googlesource.com/kernel/omap/+/android-omap-3.0/drivers/leds/leds-lm3530.c

Otherwise I can create the LM3532 driver as well and look at the LM3530

Dan

> 
> 									Pavel
> 


-- 
------------------
Dan Murphy
