From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Thu, 24 Nov 2016 15:26:47 +0100
Message-ID: <20161124142647.GJ13735@pali>
References: <20161120162116.GA15737@amd>
 <0c4e7840-064c-5d8a-c5eb-8afe71727fcd@samsung.com>
 <3d623840-34c0-9d93-9eba-92e4198e4fff@redhat.com>
 <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
 <4fcc36c6-498b-0ce7-a7c8-28c214ccef88@redhat.com>
 <ff098b73-202a-200b-5c84-e96d33199d54@samsung.com>
 <20161122145825.GS13735@pali>
 <6e8c3884-fec1-461a-e9b8-2020176ada93@samsung.com>
 <20161124091525.GG13735@pali>
 <ba7108be-82c7-2d87-c884-7284aaee80a3@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ba7108be-82c7-2d87-c884-7284aaee80a3@samsung.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: gdg@zplane.com, Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thursday 24 November 2016 15:21:36 Jacek Anaszewski wrote:
> On 11/24/2016 10:15 AM, Pali Rohár wrote:
> >On Wednesday 23 November 2016 12:01:02 Jacek Anaszewski wrote:
> >>I would also appreciate your opinion on the other solution to the
> >>problem of notifying brightness changes originating from hardware,
> >>i.e. hw_brightness_change{_ro} file, that would support POLLPRI events,
> >>and reading brightness.
> >
> >Another idea:
> >
> >If no trigger is active then led subsystem will invoke POLLPRI on
> >"brightness" sysfs file.
> >
> >And if there is active trigger then only trigger code could invoke
> >POLLPRI on "brightness" file.
> >
> >This could solve problem with high CPU load and power usage when e.g.
> >cpu trigger is active (and cpu trigger will not implement any POLLPRI).
> >
> >Do not know if this is really enough for your situation, it is just and
> >another idea.
> 
> This way we would be losing POLLPRI events when trigger is active,
> whereas it would be useful to have ones in some use cases.

In case it makes sense, trigger can implement that POLLPRI event. E.g.
for CPU trigger it probably does not make sense (or at least send
POLLPRI event lot of times per second).

> >But first please update documentation in ABI/testing to match current
> >situation. That is really needed.
> >
> 
> I suppose that you're thinking about behaviour on brightness file
> reading? Is there anything else you'd like to have clarified in the doc?

Yes, how triggers interact with brightness file, what happen when you
write 0 on active trigger, what happen when you read brightness file
with active trigger / without trigger.

-- 
Pali Rohár
pali.rohar@gmail.com
