From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] leds: ledtrig-morse: send out morse code
Date: Fri, 29 Jun 2018 04:24:39 -0400
Message-ID: <20180629082439.GA15660@kroah.com>
References: <20180628134227.GA1719@arbeit>
 <20180628185630.GA6095@amd>
 <20180628202955.GA1534@imap.1und1.de>
 <20180628204516.GA29146@amd>
 <20180629064147.GA3219@arbeit>
 <20180629071724.GA10079@amd>
 <CAMuHMdXaPz3ckT1cPZed4e=iwk3nb75UBGC66hm+b+xRDNNnNg@mail.gmail.com>
 <20180629072912.GB10079@amd>
 <CAMuHMdW1NX=BwJE0eauRLkRj1se4iRNGdxHXeajNQ-dKDhnPKw@mail.gmail.com>
 <20180629080717.GA12112@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180629080717.GA12112@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Klinger <ak@it-klinger.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Ben Whitten <ben.whitten@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Willy Tarreau <w@1wt.eu>, Philippe Ombredanne <pombredanne@nexb.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Fri, Jun 29, 2018 at 10:07:17AM +0200, Pavel Machek wrote:
> Hi!
> 
> > > There's no reason 2. should be in kernel ("mechanism, not policy").
> > >
> > > Given 1. is not really more complicated than the morse
> > > trigger... please just help with pattern trigger if you want this to
> > > happen.
> > 
> > Ah, you want to do the conversion to morse code in userspace?
> > Yes, that makes sense.
> 
> Yes, that's what I want.

We all want a pony :)

Seriously, this is a very simple module, works well, and makes some
system's life much easier as there is no external dependancy on a
text-to-morse-code library needed.

If you don't want this cluttering up your kernel, don't built it in.

I think it should be taken as-is (well, with the few changes already
recommended).

thanks,

greg k-h
