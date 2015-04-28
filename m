From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: LED subsystem child DT node ref counting
Date: Tue, 28 Apr 2015 09:15:47 +0200
Message-ID: <553F33A3.2000902@samsung.com>
References: <5530E891.20707@samsung.com>
 <CAL_JsqLVEKN_XWOLz2uOVbhf3NWf=b27DXh8NhaqvfrNsU+WNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:14807 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751889AbbD1HPy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 28 Apr 2015 03:15:54 -0400
In-reply-to: <CAL_JsqLVEKN_XWOLz2uOVbhf3NWf=b27DXh8NhaqvfrNsU+WNw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>, Bryan Wu <cooloney@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>

On 04/27/2015 03:57 PM, Rob Herring wrote:
> On Fri, Apr 17, 2015 at 6:03 AM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>> Hi,
>>
>> I'd like to clarify whether LED subsystem drivers behave correctly
>> or not, regarding child DT nodes reference counting.
>
> In general, the DT reference counting is broken. It is really only
> used on pSeries and only for certain nodes on it.
>
>> Single LED controller can have connected more then one LED to it.
>> The LEDs are represented by child DT nodes of the node representing
>> the controller (see Documentation/devicetree/bindings/leds).
>>
>> LED subsystem drivers parse child DT nodes and use the node name,
>> or 'label' property string as the LED class device name.
>>
>> This is usually accomplished like below:
>>
>> for_each_child_of_node(np, child) {
>>      ...
>>      led.name = of_get_property(child, "label", NULL) ? : child->name;
>>
>>
>> The question is whether reference count of the child node shouldn't
>> be increased here with of_node_get(child). Whereas intuitively it could
>> be thought of as a right thing to do, empirical experiments don't
>> necessary confirm that.
>>
>> When I print the value of child_node->kobj.kref.refcount.counter
>> inside for_each loop it is 3 and and after leaving the loop it gets
>> decreased to 2. On driver removal the value is also 2. It means that
>> label is available all the time, without increasing child node ref
>> counter.
>
> I believe the ref count is only left incremented if you break from the
> loop. Otherwise, it is only incremented during the loop one child at a
> time.

Child node ref count is 3 right after obtaining it with
of_get_next_available_child.

Nonetheless my further source code investigation revealed that this
does not pose an issue for the LED subsystem, as the label is copied
in the device_create_with_groups function.

The related 'name' property should be probably removed from the
struct led_classdev, as it seems to be used only for device name
initialization. It will require modifications in the existing LED
drivers though.

-- 
Best Regards,
Jacek Anaszewski
