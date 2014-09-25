From: Joe Perches <joe@perches.com>
Subject: Re: project wide: git config entry for [diff] renames=true
Date: Thu, 25 Sep 2014 11:06:31 -0700
Message-ID: <1411668391.3460.2.camel@joe-AO725>
References: <Pine.LNX.4.44L0.1409241106100.1580-100000@iolanthe.rowland.org>
	 <1411591401-5874-1-git-send-email-sojka@merica.cz>
	 <1411591401-5874-4-git-send-email-sojka@merica.cz>
	 <20140925150353.GA15325@kroah.com> <1411660111.4026.24.camel@joe-AO725>
	 <20140925180005.GA11755@peff.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtprelay0149.hostedemail.com ([216.40.44.149]:44323 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753127AbaIYSGg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Thu, 25 Sep 2014 14:06:36 -0400
In-Reply-To: <20140925180005.GA11755@peff.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jeff King <peff@peff.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Sojka <sojka@merica.cz>, linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Bryan Wu <cooloney@gmail.com>, Felipe Balbi <balbi@ti.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-kernel@vger.kernel.org, michal.vokac@comap.cz, git <git@vger.kernel.org>

On Thu, 2014-09-25 at 14:00 -0400, Jeff King wrote:
> On Thu, Sep 25, 2014 at 08:48:31AM -0700, Joe Perches wrote:
> 
> > On Thu, 2014-09-25 at 17:03 +0200, Greg Kroah-Hartman wrote:
> > 
> > > In the future, please generate a git "move" diff, which makes it easier
> > > to review, and prove that nothing really changed.  It also helps if the
> > > file is a bit different from what you diffed against, which in my case,
> > > was true.
> > 
> > Maybe it'd be possible to add 
> > 
> > [diff]
> > 	renames = true
> > 
> > to the .git/config file.
> > 
> > but I don't find a mechanism to add anything to the
> > .git/config and have it be pulled.
> 
> There is no such mechanism within git. We've resisted adding one because
> of the danger of something like:
> 
>   [diff]
>     external = rm -rf /
> 
> diff.renames is probably safe, but any config-sharing mechanism would
> have to deal with either whitelisting, or providing some mechanism for
> the puller to review changes before blindly following them.

Another mechanism might be to add a repository
top level .gitconfig and add whatever to that.
