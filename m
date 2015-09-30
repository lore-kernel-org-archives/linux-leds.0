From: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [PATCH 2/3] leds: add debugfs to device trigger
Date: Wed, 30 Sep 2015 17:47:54 +0200
Message-ID: <20150930154754.GA31149@corsair.lan>
References: <cover.1443471365.git.maciek.borzecki@gmail.com>
 <ca802c20eb972c459bb8671ba203a5f0b2b2770d.1443472356.git.maciek.borzecki@gmail.com>
 <560BECCE.6080304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <560BECCE.6080304@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
List-Id: linux-leds@vger.kernel.org

On 09/30 16:08, Jacek Anaszewski wrote:
> Hi Maciek,
>
> Please test your solution thoroughly before submitting
> the next version. Writing to debugfs register attribute
> fails due to lack of proper copying from user memory,
> which makes testing impossible.

Hi, thanks for the comment. Indeed, I noticed the problem just after
sending the patch. Surprisingly this didn't fail on iMX6 for some
reason.

Aside from the __user access problem, is the approach, in general, ok for
you or would you suggest that I changed something?

Regards,
--
Maciek Borzecki
