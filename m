From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] leds: trigger: Introduce a NETDEV trigger
Date: Tue, 28 Nov 2017 23:50:51 +0100
Message-ID: <20171128225051.GK14512@lunn.ch>
References: <1511906058-30649-1-git-send-email-ben.whitten@gmail.com>
 <1511906058-30649-2-git-send-email-ben.whitten@gmail.com>
 <f6edbdbb-2b9d-5ee6-7a74-0567ff7d9ded@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f6edbdbb-2b9d-5ee6-7a74-0567ff7d9ded@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Ben Whitten <ben.whitten@gmail.com>, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

> What LEDs do LED triggers manipulate?  I.e., where are they?

Any LEDs which the LED subsystem controls.

This is emulating what PHYs can do with there LEDs, but using generic
LEDs.

     Andrew
