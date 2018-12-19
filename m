From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Wed, 19 Dec 2018 16:08:57 -0600
Message-ID: <a3214ab3-9281-19d6-7fcc-5abae9a60ebd@ti.com>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <20181219162626.12297-3-dmurphy@ti.com> <20181219193455.GA21159@amd>
 <8740cfd6-a6b5-ad27-313b-984a9febf18a@ti.com> <20181219201047.GA23448@amd>
 <fd624cc1-9997-1cd5-c5cc-62e6897997cf@ti.com>
 <54f28115-0a7d-8e9c-3bec-6e91fb3981ec@gmail.com> <20181219220326.GA28244@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181219220326.GA28244@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 12/19/2018 04:03 PM, Pavel Machek wrote:
> Hi!
> 
>>> I don't think a user needs nor would want to have 24 different LED nodes with 24 different brightness files.
>>> Or with the LP5036 that would have 36 LED nodes.
>>>
>>> Table 1 in the data sheet shows how the outputs map to the control banks to the LED registers.
>>
>> Some time ago we had discussion with Vesa Jääskeläinen about possible
>> approaches to RGB LEDs [0]. What seemed to be the most suitable
>> variation of the discussed out-of-tree approach was the "color" property
>> and array of color triplets defined in Device Tree per each color.
>>
>> Please refer to [0] for the details.
>>
>> [0] https://lkml.org/lkml/2018/11/9/938
> 
> Yes, plus I also have the set of HSV patches somewhere... and they
> work, but I found out that HSV->RGB conversion results in loss of precision.
> 
> We may want to do something like that.
> 
> But we need to do it once, in a driver core. We obviously don't want
> each driver having different version of RGB support.

True.  But the RGB driver really should not be defining the color palette.

Maybe a "color capability" reported to user space so that the user space can make the decision.

It can report

For GPIO or constant current situations
static red
static blue
static green 

For adjustable configurations it can report:
variable red
variable blue
variable green

or even simpler "static" or "dynamic" as a return to report the RGB configuration.
The LED driver would just need to set the variable.

Dan

> 
> Best regards,
> 									Pavel
> 


-- 
------------------
Dan Murphy
