From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH 00/13] leds: fix attribute-creation races
Date: Fri, 27 Jun 2014 12:05:46 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1406271204480.21386@pobox.suse.cz>
References: <1403716136-32694-1-git-send-email-johan@kernel.org> <CAK5ve-JVBoeW+a+1PKcfCwNOC+HOdKUD=1iFrTJAZ_tqh10yuQ@mail.gmail.com> <20140626232506.GA26949@kroah.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20140626232506.GA26949@kroah.com>
Sender: linux-input-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bryan Wu <cooloney@gmail.com>, Johan Hovold <johan@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Janne Kanniainen <janne.kanniainen@gmail.com>, =?ISO-8859-15?Q?Bj=F8rn_Mork?= <bjorn@mork.no>
List-Id: linux-leds@vger.kernel.org

On Thu, 26 Jun 2014, Greg Kroah-Hartman wrote:

> > Thanks a lot for driving this. I will applied this patchset into my
> > -devel branch. After I got the Ack from Input guys, I will apply it to
> > my for-next branch then.
> 
> Series looks good to me, Johan, thanks for doing this work.

Yeah, looks good to me as well, thanks. The lm8323 change should be Acked 
by Dmitry though, as it's in his area.

-- 
Jiri Kosina
SUSE Labs
