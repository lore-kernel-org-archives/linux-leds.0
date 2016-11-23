From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Wed, 23 Nov 2016 12:01:02 +0100
Message-ID: <6e8c3884-fec1-461a-e9b8-2020176ada93@samsung.com>
References: <55cdf83d-2233-151f-08e1-11d4619e8fd5@redhat.com>
 <7b8252c4-bb2a-01dd-2404-9b81c192fb6a@gmail.com> <201611201605.17631@pali>
 <CGME20161120162126epcas3p353e606ebc3d4f0868ff2937ec0e95c14@epcas3p3.samsung.com>
 <20161120162116.GA15737@amd>
 <0c4e7840-064c-5d8a-c5eb-8afe71727fcd@samsung.com>
 <3d623840-34c0-9d93-9eba-92e4198e4fff@redhat.com>
 <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
 <4fcc36c6-498b-0ce7-a7c8-28c214ccef88@redhat.com>
 <ff098b73-202a-200b-5c84-e96d33199d54@samsung.com>
 <20161122145825.GS13735@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-reply-to: <20161122145825.GS13735@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, gdg@zplane.com
Cc: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pali, Glenn,

Thanks for your feedback.

On 11/22/2016 03:58 PM, Pali Rohár wrote:
> On Monday 21 November 2016 14:29:00 Jacek Anaszewski wrote:
>> Let's wait until every involved part agrees (Pavel, Pali).
>
> Ok, I read that discussion on linux-leds ML and finally understand
> motivation and results.
>
> Personally I still do not like current approach and big problem what I
> see is that I was not able to understand *why* introduction of
> current_brightness is needed and how userspace application should use
> it, before I read whole that linux-leds discussion.
>
> For people who already understand situation it is probably OK, but when
> I first time saw this patch series I just said WTF and description in
> Documentation files nor in commit messages did not help me.
>
> I would suggest to properly document *current* behaviour of LED sysfs
> files in Documentation/ABI before doing any decision how to solve
> current problem.
>
> Without correct documentation how sysfs LED interface behave in
> different situations (trigger is active; zero is written to brightness;
> brightness is read when blinking is active; etc) it is really hard to
> discuss about those problems. As many people (me included) first looked
> at those documentation files and think that info written here is correct
> and handle everything...
>
> Adding trigger for LED devices which belongs to keyboard backlight has
> only disadvantage: You cannot set other kernel trigger to control level
> of keyboard backlight.
>
> I can imagine that trigger "key pressed" or "mouse moved" can be really
> useful for controlling keyboard backlight level. But that new keyboard
> backlight trigger just disallow it.
>

On 11/22/2016 04:20 PM, Glenn Golden wrote:
 > +1 on the above sentiment, sense of frustration well expressed.

So we have more voices against the trigger approach.

I would also appreciate your opinion on the other solution to the
problem of notifying brightness changes originating from hardware,
i.e. hw_brightness_change{_ro} file, that would support POLLPRI events,
and reading brightness.

Do you find the file name informative enough or maybe you'd like to
propose other name, or even entirely different approach?

-- 
Best regards,
Jacek Anaszewski
