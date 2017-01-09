From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH v2 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Mon, 9 Jan 2017 14:54:35 -0600
Message-ID: <CAB=NE6Wi0rDMG4pBZs-k+Sm7t15tspJHm6vg58gmT_BcoUNLHQ@mail.gmail.com>
References: <20161216111038.22064-1-mcgrof@kernel.org> <20161216111038.22064-6-mcgrof@kernel.org>
 <alpine.DEB.2.10.1612191121450.2994@hadrien> <20170109204654.GD13946@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:40086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753779AbdAIUzE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 9 Jan 2017 15:55:04 -0500
In-Reply-To: <20170109204654.GD13946@wotan.suse.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ming Lei <ming.lei@canonical.com>, Daniel Wagner <daniel.wagner@bmw-carit.de>, Tom Gundersen <teg@jklm.no>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vikram Mulukutla <markivx@codeaurora.org>, Stephen Boyd <stephen.boyd@linaro.org>, Mark Brown <broonie@kernel.org>, Mimi Zohar <zohar@linux.vnet.ibm.com>, Takashi Iwai <tiwai@suse.de>, Johannes Berg <johannes@sipsolutions.net>, Christian Lamparter <chunkeey@googlemail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Josh Boyer <jwboyer@fedoraproject.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

On Mon, Jan 9, 2017 at 2:46 PM, Luis R. Rodriguez <mcgrof@kernel.org> wrote:
> On Mon, Dec 19, 2016 at 11:23:17AM +0100, Julia Lawall wrote:
>> It looks suspicious that your added a new rule r0, that the python rule
>> below depends on r0 failing, and that the rule with the * (context mode)
>> does not depend on r0 in any way.
>
> You're right, the context mode would report all cases, I've changed it as follows:

That still didn't cut it.. will dig further.

 Luis
