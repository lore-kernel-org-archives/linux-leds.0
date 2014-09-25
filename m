From: Joe Perches <joe@perches.com>
Subject: project wide: git config entry for [diff] renames=true
Date: Thu, 25 Sep 2014 08:48:31 -0700
Message-ID: <1411660111.4026.24.camel@joe-AO725>
References: <Pine.LNX.4.44L0.1409241106100.1580-100000@iolanthe.rowland.org>
	 <1411591401-5874-1-git-send-email-sojka@merica.cz>
	 <1411591401-5874-4-git-send-email-sojka@merica.cz>
	 <20140925150353.GA15325@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140925150353.GA15325@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Sojka <sojka@merica.cz>, linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Bryan Wu <cooloney@gmail.com>, Felipe Balbi <balbi@ti.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-kernel@vger.kernel.org, michal.vokac@comap.cz, git <git@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, 2014-09-25 at 17:03 +0200, Greg Kroah-Hartman wrote:

> In the future, please generate a git "move" diff, which makes it easier
> to review, and prove that nothing really changed.  It also helps if the
> file is a bit different from what you diffed against, which in my case,
> was true.

Maybe it'd be possible to add 

[diff]
	renames = true

to the .git/config file.

but I don't find a mechanism to add anything to the
.git/config and have it be pulled.
