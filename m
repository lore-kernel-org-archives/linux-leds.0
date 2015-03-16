From: =?ISO-8859-1?Q?Rapha=EBl?= Teysseyre <rteysseyre@gmail.com>
Subject: Re: [PATCH] leds: Add arbitrary pattern trigger
Date: Mon, 16 Mar 2015 17:49:22 +0100
Message-ID: <1426524562.11707.17.camel@localhost>
References: <1424334377.11286.3.camel@localhost>
	 <CAK5ve-KTmkh4XBLAEhvUFme+qmTb9hFKxQnvisxySw1skTLr1w@mail.gmail.com>
	 <20150310080042.GA27585@amd> <BLU172-W3716E59BC9E98F60F424C4AC180@phx.gbl>
	 <20150310192226.GB11260@amd> <1426086614.59115.14.camel@localhost>
	 <20150311190255.GA20247@amd> <1426500410.11707.6.camel@localhost>
	 <20150316115547.GA9347@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150316115547.GA9347@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Bryan Wu <cooloney@gmail.com>, Joe Xue <lgxue@hotmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

> Got this while playing with my hid-sony patches:

Sorry about that, it's me being dumb and using a mutex in an atomic con=
text...

Rapha=C3=ABl
