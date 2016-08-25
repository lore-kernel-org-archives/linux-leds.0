From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH RFC V3.5] leds: trigger: Introduce an USB port trigger
Date: Thu, 25 Aug 2016 10:32:29 +0200
Message-ID: <CACna6rzYgdmjZEWs9SVDPuCr1TguDODCLHyGeD-6W+v-R1aZ8A@mail.gmail.com>
References: <20160823220404.9887-1-zajec5@gmail.com> <20160824175345.7033-1-zajec5@gmail.com>
 <ebef68e9-a987-3829-8823-827b2efc6626@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <ebef68e9-a987-3829-8823-827b2efc6626@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Stephan Linz <linz@li-pro.net>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 25 August 2016 at 10:03, Jacek Anaszewski <j.anaszewski@samsung.com> wro=
te:
> On 08/24/2016 07:52 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>>
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>
>> This commit adds a new trigger responsible for turning on LED when USB
>> device gets connected to the specified USB port. This can can useful for
>> various home routers that have USB port(s) and a proper LED telling user
>> a device is connected.
>>
>> The trigger gets its documentation file but basically it just requires
>> specifying USB port in a Linux format (e.g. echo 1-1 > new_port).
>>
>> During work on this trigger there was a plan to add DT bindings for it,
>> but there wasn't an agreement on the format yet. This can be worked on
>> later, a sysfs interface is needed anyway for platforms not using DT.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>> ---
>> V2: Trying to add DT support, idea postponed as it will take more time
>>     to discuss the bindings.
>> V3: Fix typos in commit and Documentation (thanks Jacek!)
>>     Use "ports" sysfs file for adding and removing USB ports (thx Jacek)
>>     Check if there is USB device connected after adding new USB port
>>     Fix memory leak or two
>> V3.5: Fix e-mail address (thanks Matthias)
>>       Simplify conditions in usbport_trig_notify (thx Matthias)
>>       Make "ports" a subdirectory with file per port, to match one value
>>       per file sysfs rule (thanks Greg)
>>       As "ports" couldn't be used for adding and removing ports anymore,
>>       there are now "new_port" and "remove_port". Having them makes this
>>       API also common with e.g. pci and usb buses.
>
>
> Now writing new_port with "1-1" produces a file named "1-1" in the
> ports directory with 000 permissions. I think that what Greg had
> on mind by referring to "one value per file" rule was a set of
> files representing ports, like "1-1 1-2 2-1", and each file should be
> readable/writeable.

On the other hand, when I described my idea with "new_port" and
"remove_port", Greg replied with "Maybe", so I'm not sure if he really
got a design you described in his mind.

Greg: could you comment on this sysfs interface, please? :)

--=20
Rafa=C5=82
