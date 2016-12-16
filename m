From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Fri, 16 Dec 2016 09:19:47 -0600
Message-ID: <CAB=NE6W97xUFbTa04hOXF9sojp043aKYO9LnmZ0+QOLgdbj6Nw@mail.gmail.com>
References: <20161213030828.17820-1-mcgrof@kernel.org> <20161213030828.17820-6-mcgrof@kernel.org>
 <20161213190429.GC8676@amd> <20161216092241.GO13946@wotan.suse.de>
 <20161216092919.GA26091@amd> <20161216095906.GS13946@wotan.suse.de>
 <20161216101405.GA29069@amd> <20161216105648.GT13946@wotan.suse.de> <20161216112700.GB29069@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:41358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757726AbcLPP3K (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Dec 2016 10:29:10 -0500
In-Reply-To: <20161216112700.GB29069@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ming Lei <ming.lei@canonical.com>, Daniel Wagner <daniel.wagner@bmw-carit.de>, Tom Gundersen <teg@jklm.no>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vikram Mulukutla <markivx@codeaurora.org>, Stephen Boyd <stephen.boyd@linaro.org>, Mark Brown <broonie@kernel.org>, Mimi Zohar <zohar@linux.vnet.ibm.com>, Takashi Iwai <tiwai@suse.de>, Johannes Berg <johannes@sipsolutions.net>, Christian Lamparter <chunkeey@googlemail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Josh Boyer <jwboyer@fedoraproject.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, David Woodhouse <dwmw2@infradead.org>

On Fri, Dec 16, 2016 at 5:27 AM, Pavel Machek <pavel@ucw.cz> wrote:
> On Fri 2016-12-16 11:56:48, Luis R. Rodriguez wrote:
>> On Fri, Dec 16, 2016 at 11:14:05AM +0100, Pavel Machek wrote:
>> >
>> > Well, I was asking if the above snipped looks like valid use. Because
>> > AFAICT, the "custom fallback" is just dev_err(), see above. Coccinelle
>> > rules don't help me...
>>
>> Its not. Its when you ask for no uevent. Only 2 drivers do this.
>
> That was one of two you listed. If that is not valid use, perhaps it
> should be removed, not annotated?

Pavel, the annotation was added on top of:

static int lp55xx_request_firmware(struct lp55xx_chip *chip)
{
        const char *name = chip->cl->name;
        struct device *dev = &chip->cl->dev;

        return request_firmware_nowait(THIS_MODULE, false, name, dev,
                                GFP_KERNEL, chip, lp55xx_firmware_loaded);
}

Note the second argument is false. This matches the grammar and the
definition for a custom fallback mechanism since uevents are not used.
What am I missing?

 Luis
