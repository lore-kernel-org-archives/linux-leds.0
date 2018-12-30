From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Sun, 30 Dec 2018 18:09:35 +0100
Message-ID: <4b5a89ed-0c0b-3103-ca57-a0f97aa5ace9@gmail.com>
References: <20181219193455.GA21159@amd>
 <8740cfd6-a6b5-ad27-313b-984a9febf18a@ti.com> <20181219201047.GA23448@amd>
 <fd624cc1-9997-1cd5-c5cc-62e6897997cf@ti.com>
 <54f28115-0a7d-8e9c-3bec-6e91fb3981ec@gmail.com>
 <cd90f179-6c16-823f-496f-27f141e9c322@ti.com>
 <71d3ac12-5beb-0a26-71e1-5eae798e7b9f@gmail.com>
 <2bca210b-76ad-d5a9-906c-4151695050c3@gmail.com>
 <45ce01f0-af6e-1cc6-5126-fb557c7d2a82@ti.com>
 <b7c69135-1641-48cb-1770-c4c77a989efe@gmail.com> <20181229190726.GA29851@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181229190726.GA29851@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 12/29/18 8:07 PM, Pavel Machek wrote:
> Hi!
> 
>>>> With the "color" sysfs file it will make more sense to allow for user
>>>> defined color palettes.
>>>>
>>>
>>> I think defining these values in the device tree or acpi severely limits the devices
>>> capabilities.  Especially in development phases.  If the knobs were exposed then the user space
>>> can create new experiences.  The color definition should be an absolute color defined in the dt and
>>> either the framework or user space needs to mix these appropriately.  IMO user space should set the policy
>>> of the user experience and the dt/acpi needs to set the capabilities.
>>>
>>> I do like Pavels idea on defining the more standard binding pattern to "group" leds into a single group.
>>>
>>> Maybe the framework could take these groups and combine/group them into a single node with the groups colors.
>>
>> There is still HSV approach [0] in store. One problem with proposed
>> implementation is fixed algorithm of RGB <-> HSV color space conversion.
>> Maybe allowing for some board specific adjustments in DT would add
>> more flexibility.
>>
>> [0] https://lkml.org/lkml/2017/8/31/255
> 
> Yes we could do HSV. Problem is that that we do not really have RGB
> available. We do have integers for red, green and blue, but they do
> not correspond to RGB colorspace.

OK, so conversion from HSV to RGB would only increase the aberration.
So, let's stick to RGB - we've got to have some stable ground and this
is something that the hardware at least pretends to be compliant with.

Our problem is how to set the color atomically. With HSV approach we
were to obviate the problem by mapping brightness file to the "V"
component of that color space, and write all H,S and V values to the
hardware only on write to brightness file.

We could apply similar approach in case of RGB LED class device.
We would have four files instead of a single brightness file:
red, green, blue and main_color. First three would accept values
within 0-255 range, and main_color would accept one of
"red", "green" or "blue". LED RGB class driver would write all
color components to the hardware only on write to the file corresponding
to the main_color. Also LED Trigger core would be taught to map
brightness value to the main_color for RGB LEDs.

Of course a new internal kernel API for setting color would
have to be provided for use by dedicated RGB triggers.

-- 
Best regards,
Jacek Anaszewski
