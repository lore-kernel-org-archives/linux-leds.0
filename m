From: David Lechner <david@lechnology.com>
Subject: Re: [RFC] User-defined leds
Date: Fri, 5 Aug 2016 14:54:33 -0500
Message-ID: <8db4e308-ae2f-ee8a-d570-cd751c4f0269@lechnology.com>
References: <57965C15.1070705@lechnology.com>
 <DB74DD94-7737-4F06-BD35-D698A65E30AD@holtmann.org>
 <20160805195130.GA26694@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160805195130.GA26694@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Marcel Holtmann <marcel@holtmann.org>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joel Becker <jlbec@evilplan.org>
List-Id: linux-leds@vger.kernel.org

On 08/05/2016 02:51 PM, Pavel Machek wrote:
>
> Could the device tree be used to bind LED driver to otherwise unused
> gpio?
>
> 								Pavel
>

There is already a leds-gpio driver that does this.

https://www.kernel.org/doc/Documentation/devicetree/bindings/leds/leds-gpio.txt
