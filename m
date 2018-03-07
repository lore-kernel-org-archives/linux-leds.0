From: Ben Hutchings <ben.hutchings@codethink.co.uk>
Subject: Re: [PATCH 4.4 16/34] led: core: Fix brightness setting when
 setting delay_off=0
Date: Wed, 07 Mar 2018 15:32:23 +0000
Message-ID: <1520436743.23626.33.camel@codethink.co.uk>
References: <20180302084435.842679610@linuxfoundation.org>
         <20180302084437.007951262@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180302084437.007951262@linuxfoundation.org>
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Matthieu CASTET <matthieu.castet@parrot.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: stable@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Fri, 2018-03-02 at 09:51 +0100, Greg Kroah-Hartman wrote:
> 4.4-stable review patch.  If anyone has any objections, please let me
> know.
> 
> ------------------
> 
> From: Matthieu CASTET <matthieu.castet@parrot.com>
> 
> 
> [ Upstream commit 2b83ff96f51d0b039c4561b9f95c824d7bddb85c ]
> 
> With the current code, the following sequence won't work :
> echo timer > trigger
> 
> echo 0 >  delay_off
> * at this point we call
> ** led_delay_off_store
> ** led_blink_set
[...]

The commit message got cut truncated here, which resulted in addresses
being omitted when it was sent out for review.  The upstream commit
message refers to a LED_BLINK_SW flag which is not used in 4.4.  So
this fix probably isn't needed, though I can't tell whether it does any
harm.

Ben.

-- 
Ben Hutchings
Software Developer, Codethink Ltd.
