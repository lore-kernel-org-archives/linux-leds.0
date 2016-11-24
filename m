From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Thu, 24 Nov 2016 15:21:36 +0100
Message-ID: <ba7108be-82c7-2d87-c884-7284aaee80a3@samsung.com>
References: <201611201605.17631@pali>
 <CGME20161120162126epcas3p353e606ebc3d4f0868ff2937ec0e95c14@epcas3p3.samsung.com>
 <20161120162116.GA15737@amd>
 <0c4e7840-064c-5d8a-c5eb-8afe71727fcd@samsung.com>
 <3d623840-34c0-9d93-9eba-92e4198e4fff@redhat.com>
 <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
 <4fcc36c6-498b-0ce7-a7c8-28c214ccef88@redhat.com>
 <ff098b73-202a-200b-5c84-e96d33199d54@samsung.com>
 <20161122145825.GS13735@pali>
 <6e8c3884-fec1-461a-e9b8-2020176ada93@samsung.com>
 <20161124091525.GG13735@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34083 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965062AbcKXOVm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Nov 2016 09:21:42 -0500
In-reply-to: <20161124091525.GG13735@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: gdg@zplane.com, Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

On 11/24/2016 10:15 AM, Pali Rohár wrote:
> On Wednesday 23 November 2016 12:01:02 Jacek Anaszewski wrote:
>> I would also appreciate your opinion on the other solution to the
>> problem of notifying brightness changes originating from hardware,
>> i.e. hw_brightness_change{_ro} file, that would support POLLPRI events,
>> and reading brightness.
>
> Another idea:
>
> If no trigger is active then led subsystem will invoke POLLPRI on
> "brightness" sysfs file.
>
> And if there is active trigger then only trigger code could invoke
> POLLPRI on "brightness" file.
>
> This could solve problem with high CPU load and power usage when e.g.
> cpu trigger is active (and cpu trigger will not implement any POLLPRI).
>
> Do not know if this is really enough for your situation, it is just and
> another idea.

This way we would be losing POLLPRI events when trigger is active,
whereas it would be useful to have ones in some use cases.

> But first please update documentation in ABI/testing to match current
> situation. That is really needed.
>

I suppose that you're thinking about behaviour on brightness file
reading? Is there anything else you'd like to have clarified in the doc?

-- 
Best regards,
Jacek Anaszewski
