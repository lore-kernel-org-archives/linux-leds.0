From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v4 1/3] leds: Introduce userspace leds driver
Date: Thu, 22 Sep 2016 11:45:51 -0500
Message-ID: <c5f17977-c04e-9b12-dd4b-8281f746a42d@lechnology.com>
References: <1474053410-24387-1-git-send-email-david@lechnology.com>
 <1474053410-24387-2-git-send-email-david@lechnology.com>
 <CACRpkdZH4aJxbbPOnmvCapPaw78+Wtu8pjpC=oWGJpAvmO+WVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vern.gendns.com ([206.190.152.46]:37099 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934779AbcIVQpv (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 22 Sep 2016 12:45:51 -0400
In-Reply-To: <CACRpkdZH4aJxbbPOnmvCapPaw78+Wtu8pjpC=oWGJpAvmO+WVw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Pavel Machek <pavel@ucw.cz>

On 09/22/2016 08:43 AM, Linus Walleij wrote:
> On Fri, Sep 16, 2016 at 9:16 PM, David Lechner <david@lechnology.com> wrote:
>
>> This driver creates a userspace leds driver similar to uinput.
>
> Just out of curiosity: what is this used for?
> The typical usecase evades me, so I'd really want to know.
>

Several use cases are explained in this thread:
https://lkml.org/lkml/2016/7/25/505


>> +See tools/leds/uledmon.c for an example userspace program.
>
> Where is this program? Not in this patch for sure.
>
> Yours,
> Linus Walleij
>
