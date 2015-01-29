From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/2] DT: leds: Add led-sources property
Date: Thu, 29 Jan 2015 14:59:42 -0800
Message-ID: <CAK5ve-L9W1+jED=jT9UYaU8CeN+QaGskHoo-os+ABZhJqN6n3w@mail.gmail.com>
References: <1422346028-16739-1-git-send-email-j.anaszewski@samsung.com>
 <1422346028-16739-2-git-send-email-j.anaszewski@samsung.com>
 <54CA49F8.2030501@samsung.com> <CAL_JsqK28ZKLrzFH175GM9Ekbem2JcB9GhL-yB2-J4fq0RMCzg@mail.gmail.com>
 <CAK5ve-LKBfjRzxK_b0ByEF5uWHfAaBGS2OPznOiYNg9+FJP5Gg@mail.gmail.com> <20150129223010.GA2110@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:43839 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752664AbbA2XAD (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 29 Jan 2015 18:00:03 -0500
In-Reply-To: <20150129223010.GA2110@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robherring2@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, Sakari Ailus <sakari.ailus@iki.fi>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>

On Thu, Jan 29, 2015 at 2:30 PM, Pavel Machek <pavel@ucw.cz> wrote:
> On Thu 2015-01-29 14:14:54, Bryan Wu wrote:
>> On Thu, Jan 29, 2015 at 1:03 PM, Rob Herring <robherring2@gmail.com> wrote:
>> > On Thu, Jan 29, 2015 at 8:55 AM, Jacek Anaszewski
>> > <j.anaszewski@samsung.com> wrote:
>> >> Hi Rob,
>> >>
>> >> Have we achieved consensus concerning this patch?
>> >> If so, can you give your ack?
>> >
>> > I think so.
>> >
>> > Acked-by: Rob Herring <robh@kernel.org>
>> >
>> >>
>>
>> OK, I can merge this patch into my tree with you guys Ack.
>> Jacek, does this patch depend on the first one which you are still
>> discussing with Pavel? Can I merge this one firstly.
>
> Yes, you can.. they are independend.
>                                                                 Pavel

Applied, thanks.
-Bryan
