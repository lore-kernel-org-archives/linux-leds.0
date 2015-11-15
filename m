From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/3] leds: add debugfs to device trigger
Date: Sun, 15 Nov 2015 12:22:23 +0100
Message-ID: <20151115112223.GA13323@xo-6d-61-c0.localdomain>
References: <cover.1443472356.git.maciek.borzecki@gmail.com>
 <ca802c20eb972c459bb8671ba203a5f0b2b2770d.1443472356.git.maciek.borzecki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ca802c20eb972c459bb8671ba203a5f0b2b2770d.1443472356.git.maciek.borzecki@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maciek Borzecki <maciek.borzecki@gmail.com>
Cc: linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
List-Id: linux-leds@vger.kernel.org

On Mon 2015-09-28 22:43:04, Maciek Borzecki wrote:
> Add debugfs entries for device activity trigger. Three entries are
> created under /sys/kernel/debug/ledtrig-dev when the driver gets
> loaded. These are:
> 
>   devices - cat'ing will produce a list of currently registered devices
>             in <major>:<minor> format, a line for each device.
> 
>   register - echo'ing <major>:<minor> will create a trigger for this
>              device
> 
>   trigger - echo'ing <major>:<minor> will fire a trigger for this device

Debugfs? Please don't. This is not debugging infrastructure.

