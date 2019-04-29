From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: linux-next: Tree for Apr 29 (drivers/leds/leds-turris-omnia)
Date: Mon, 29 Apr 2019 20:49:59 +0200
Message-ID: <ccf6596b-e645-a9b3-dfab-96ff14e8b70d@metux.net>
References: <20190429190354.0d5e2e93@canb.auug.org.au>
 <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
 <20190429153200.GA11761@amd> <20190429173842.06f02852@nic.cz>
 <20190429163753.GA16782@amd> <20190429184439.68049050@nic.cz>
 <20190429165319.GB16782@amd> <c045db7f-2147-1a58-8d65-8b52fddd932c@metux.net>
 <20190429181245.GA24658@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429181245.GA24658@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Marek Behun <marek.behun@nic.cz>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 29.04.19 20:12, Pavel Machek wrote:

>> Is that controller only built-in into some SoCs, or also available
>> as a separate chip ?
> 
> AFAIU.. separate chip, but runs firmware not likely to be available
> outside Turris routers.

hmm, if it's a separate chip, IMHO it should be selectable, so that
anybody who puts that chip on his board can directly use it.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
