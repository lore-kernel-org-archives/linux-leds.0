From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH RFC V3.5] leds: trigger: Introduce an USB port trigger
Date: Fri, 26 Aug 2016 17:58:23 +0200
Message-ID: <CACna6rxs0X3wWp2BPdVgOK+0Hrmp3BM9WXcW4oihrcuhjV1W6g@mail.gmail.com>
References: <Pine.LNX.4.44L0.1608251026010.1827-100000@iolanthe.rowland.org> <57BF3D64.3090402@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <57BF3D64.3090402@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Stephan Linz <linz@li-pro.net>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, Pavel Machek <pavel>
List-Id: linux-leds@vger.kernel.org

On 25 August 2016 at 20:48, Jacek Anaszewski <jacek.anaszewski@gmail.com> w=
rote:
> On 08/25/2016 04:30 PM, Alan Stern wrote:
>>
>> On Thu, 25 Aug 2016, Jacek Anaszewski wrote:
>>
>>> I'd see it as follows:
>>>
>>> #cat available_ports
>>> #1-1 1-2 2-1
>>>
>>> #echo "1-1" > new_port
>>>
>>> #cat observed_ports
>>> #1-1
>>>
>>> #echo "2-1" > new_port
>>>
>>> #cat observed_ports
>>> #1-1 2-1
>>>
>>> We've already had few discussions about the sysfs designs trying
>>> to break the one-value-per-file rule for LED class device, and
>>> there was always strong resistance against.
>>
>>
>> This scheme has multiple values in both the available_ports and
>> observed_ports files.  :-(  Not that I have any better suggestions...
>
>
> Right, I forgot to add a note here, that this follows space
> separated list pattern similarly as in case of triggers attribute.
> Of course other suggestions are welcome.

So ppl have doubts about multiple values in a single sysfs file
(whatever we call it: "ports" or "observed_ports"). Greg clearly said:
> sysfs is "one value per file", here you are listing a bunch of things in
> one sysfs file.  Please don't do that.

What about my idea of using "ports" subdirectory and having each port
as separated file inside that subdir? I think there are two ways of
doing this:

1) Having "ports" subdir with 0x0000 chmod files, one per each port
specified as observable
In this solution we need "new_port" and "remove_port" that can be used
for management of observable ports.
I think Jacek wasn't happy with this chmod and he believes Greg meant R/W f=
iles.

2) Having "ports" subdir with RW files, one per each existing physical port
In this situation we don't need "new_port" or "remove_port". If we
want port to be observable we just do:
echo 1 > 1-1
Implementing this solution needs reading more details from USB subsystem.

Do you find any of solutions with "ports" subdir better than dealing
with new-line/space separated values in a single sysfs file?

--=20
Rafa=C5=82
