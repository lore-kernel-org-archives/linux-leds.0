From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH RFC V3.5] leds: trigger: Introduce an USB port trigger
Date: Mon, 29 Aug 2016 10:29:36 +0200
Message-ID: <2f89516b-f9bb-451a-9db2-6d9c245018a0@samsung.com>
References: <Pine.LNX.4.44L0.1608251026010.1827-100000@iolanthe.rowland.org>
 <57BF3D64.3090402@gmail.com> <20160826195034.GC21442@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20160826195034.GC21442@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Stephan Linz <linz@li-pro.net>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 08/26/2016 09:50 PM, Pavel Machek wrote:
> On Thu 2016-08-25 20:48:04, Jacek Anaszewski wrote:
>> On 08/25/2016 04:30 PM, Alan Stern wrote:
>>> On Thu, 25 Aug 2016, Jacek Anaszewski wrote:
>>>
>>>> I'd see it as follows:
>>>>
>>>> #cat available_ports
>>>> #1-1 1-2 2-1
>>>>
>>>> #echo "1-1" > new_port
>>>>
>>>> #cat observed_ports
>>>> #1-1
>>>>
>>>> #echo "2-1" > new_port
>>>>
>>>> #cat observed_ports
>>>> #1-1 2-1
>>>>
>>>> We've already had few discussions about the sysfs designs trying
>>>> to break the one-value-per-file rule for LED class device, and
>>>> there was always strong resistance against.
>>>
>>> This scheme has multiple values in both the available_ports and
>>> observed_ports files.  :-(  Not that I have any better suggestions...
>>
>> Right, I forgot to add a note here, that this follows space
>> separated list pattern similarly as in case of triggers attribute.
>> Of course other suggestions are welcome.
>>
>>>>>> Also a description of the device connected to the port would be a nice
>>>>>> feature, however I am not certain about the feasibility thereof.
>>>>>
>>>>> What kind of description do you mean? Where should it be used / where
>>>>> should it appear?
>>>>>
>>>>
>>>> Product name/symbol. Actually it should be USB subsystem responsibility
>>>> to provide the means for querying the product name by port id, if it
>>>> is possible at all.
>>>
>>> 	cat /sys/bus/usb/devices/PORT/product
>>> 	cat /sys/bus/usb/devices/PORT/manufacturer
>>>
>>> These will work if there is a device registered under PORT.
>>
>> I've found only idProduct and idVendor files. They indeed uniquely
>> identify the device, but the numbers are not human readable.
>
> Actually, they don't. They identify device _type_. If you have two
> mice of the same type connected, they'll have same idProduct /
> idVendor values.

That's true. We'd have to be able to distinguish between the devices
of the same type. The only way seems to be the port id, whereas
the initial intention was to give a hint on what device is represented
by given port id :-)

Regardless of that, having a device name instead of port id would allow
for unique identification of a device in most of cases.

-- 
Best regards,
Jacek Anaszewski
