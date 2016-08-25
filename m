From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH RFC V3.5] leds: trigger: Introduce an USB port trigger
Date: Thu, 25 Aug 2016 20:48:04 +0200
Message-ID: <57BF3D64.3090402@gmail.com>
References: <Pine.LNX.4.44L0.1608251026010.1827-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1608251026010.1827-100000@iolanthe.rowland.org>
Sender: linux-doc-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Stephan Linz <linz@li-pro.net>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org

On 08/25/2016 04:30 PM, Alan Stern wrote:
> On Thu, 25 Aug 2016, Jacek Anaszewski wrote:
>
>> I'd see it as follows:
>>
>> #cat available_ports
>> #1-1 1-2 2-1
>>
>> #echo "1-1" > new_port
>>
>> #cat observed_ports
>> #1-1
>>
>> #echo "2-1" > new_port
>>
>> #cat observed_ports
>> #1-1 2-1
>>
>> We've already had few discussions about the sysfs designs trying
>> to break the one-value-per-file rule for LED class device, and
>> there was always strong resistance against.
>
> This scheme has multiple values in both the available_ports and
> observed_ports files.  :-(  Not that I have any better suggestions...

Right, I forgot to add a note here, that this follows space
separated list pattern similarly as in case of triggers attribute.
Of course other suggestions are welcome.

>>>> Also a description of the device connected to the port would be a nice
>>>> feature, however I am not certain about the feasibility thereof.
>>>
>>> What kind of description do you mean? Where should it be used / where
>>> should it appear?
>>>
>>
>> Product name/symbol. Actually it should be USB subsystem responsibility
>> to provide the means for querying the product name by port id, if it
>> is possible at all.
>
> 	cat /sys/bus/usb/devices/PORT/product
> 	cat /sys/bus/usb/devices/PORT/manufacturer
>
> These will work if there is a device registered under PORT.

I've found only idProduct and idVendor files. They indeed uniquely
identify the device, but the numbers are not human readable.
Is there a way to retrieve the corresponding names in kernel?
Does the lsusb command do the mapping in the user space or maybe
it takes the names from kernel?

-- 
Best regards,
Jacek Anaszewski
