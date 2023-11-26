Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E0DED;
	Sun, 26 Nov 2023 14:11:08 -0800 (PST)
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r7NLC-0002Gx-1q;
	Sun, 26 Nov 2023 22:11:03 +0000
Date: Sun, 26 Nov 2023 22:11:00 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Li Zetao <lizetao1@huawei.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: netdev: extend speeds up to 10G
Message-ID: <ZWPCdHBt_g4-5ArV@makrotopia.org>
References: <3655d56c08b60f0ce562ceab3a627fef046a7617.1701029732.git.daniel@makrotopia.org>
 <4bade634-f2f7-4bfc-b882-67cfe9e47b8f@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bade634-f2f7-4bfc-b882-67cfe9e47b8f@lunn.ch>

Hi Andrew,

On Sun, Nov 26, 2023 at 10:04:22PM +0100, Andrew Lunn wrote:
> On Sun, Nov 26, 2023 at 08:17:03PM +0000, Daniel Golle wrote:
> > Add 2.5G, 5G and 10G as available speeds to the netdev LED trigger.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
> One thing to consider is how this get merged. I assume you will have a
> PHY driver patch soon making use of this?

Yes, exactly. I'm working on adding support for LEDs to MaxLinear and
RealTek PHY drivers.

> We can either:
> 
> 1) Get Lee to merge it into the LED tree and then create a stable
> branch which gets pulled into netdev.
> 
> 2) Merge into netdev, with Lees Acked-by: 
> 
> It seems unlikely there will be any merge conflicts. So netdev does
> seem like an O.K. way to go.

Via netdev (net-next) would be better imho as it would allow to add
changes to PHY drivers making use of the new constants without having
to wait for LED tree being merged.

Note that I've sent v2 which adds missing use of sysfs attributes.


Thank you!


Daniel
