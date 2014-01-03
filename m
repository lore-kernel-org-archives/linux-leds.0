From: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] Add LED pattern trigger
Date: Fri, 3 Jan 2014 10:33:51 +0100
Message-ID: <CAFLxGvwmS790goxNhO33p63MAic_bV8dpY+iMVFhuCUrxCWcbw@mail.gmail.com>
References: <1388362275-1618-1-git-send-email-lgxue@hotmail.com>
	<20131230162158.7420e811@alan.etchedpixels.co.uk>
	<BLU172-W451DF59115DB2B0A7F694AACC90@phx.gbl>
	<20140101201053.12be7d27@alan.etchedpixels.co.uk>
	<alpine.DEB.2.02.1401011423180.27645@nftneq.ynat.uz>
	<20140101230135.48f6f781@alan.etchedpixels.co.uk>
	<alpine.DEB.2.02.1401011547340.27645@nftneq.ynat.uz>
	<CAK5ve-KTQvJeLXmJt-NgPy6Ju+kBzWVoSQB7TKR9TW+mfD=bxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAK5ve-KTQvJeLXmJt-NgPy6Ju+kBzWVoSQB7TKR9TW+mfD=bxg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: David Lang <david@lang.hm>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Joe Xue <lgxue@hotmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Jan 3, 2014 at 1:14 AM, Bryan Wu <cooloney@gmail.com> wrote:
> IMHO, firstly we should take this trigger into kernel, most time it
> works as a module. But we need to define a good interface between
> kernel and user space.

Put it in first place into the kernel such that it becomes ABI and
nobody is allowed
to remove it later?

Better design a sane interface such that such complex LED operations
can be achieved
in userspace using an helper library.

-- 
Thanks,
//richard
