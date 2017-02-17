From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v8 3/7] platform/x86/thinkpad: Call
 led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Thu, 16 Feb 2017 19:45:31 -0800
Message-ID: <20170217034531.GB25241@wisp>
References: <20170209154417.19040-1-hdegoede@redhat.com>
 <20170209154417.19040-4-hdegoede@redhat.com>
 <1486663705.1046615.875913456.7B8ADABA@webmail.messagingengine.com>
 <CAHp75Vdt4SNOuYTkxg_F+pSs3FY8zA9jdOWG+Cp8hzxS7vtsVQ@mail.gmail.com>
 <40d0f346-5090-ef01-4ee7-69b72458cfa2@redhat.com>
 <CAHp75VcFE6Jxnk8qBjPst4w9DP3KLNmxzg1ZSwzz5Qw9xhdmRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:40586 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754684AbdBQDpi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Feb 2017 22:45:38 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75VcFE6Jxnk8qBjPst4w9DP3KLNmxzg1ZSwzz5Qw9xhdmRg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Andy Shevchenko <andy@infradead.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-leds@vger.kernel.org

On Tue, Feb 14, 2017 at 11:33:49AM +0200, Andy Shevchenko wrote:
> On Tue, Feb 14, 2017 at 11:25 AM, Hans de Goede <hdegoede@redhat.com> wrote:
> > On 13-02-17 23:52, Andy Shevchenko wrote:
> >> On Thu, Feb 9, 2017 at 8:08 PM, Henrique de Moraes Holschuh
> >> <hmh@hmh.eng.br> wrote:
> >>> On Thu, Feb 9, 2017, at 13:44, Hans de Goede wrote:
> 
> >>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> 
> >> Thanks, thinkpad_acpi bits are applied to testing
> 
> > Thank you, so the Dell bits are waiting for Pali's ack ?
> > Note the Dell bits have been tested on actual hardware too.
> 
> This cycle shows a flaw in my understanding of process. I've
> mistakenly pushed couple of patches without maintainers' review. So, I
> guess from now on we highly recommend to have a tag from actual
> maintainer before we are going to proceed.
> 
> Darren, if you think this is too strong, what would be better approach?

What I've discussed with the various driver maintainers is they should reply
within a week, and after that, I (now Andy and/or I) will make the decision.

I try to stick to this especially for functional changes. For DMI matches and
new HIDs and other trivial things, I usually just queue to testing and ask the
maintainer if they have any objections, and take silence for accent :)

I do think there is value in getting the patch into testing as soon as possible,
even while waiting for the driver maintainer to get to it. The risk would be
accidentally committing a patch a maintainer objects to. I don't think this has
happened yet as an email from the maintainer can trigger dropping the patch. We
can discuss how to manage the corner cases offline.

-- 
Darren Hart
Intel Open Source Technology Center
