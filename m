From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH] leds: gpio: Drop unneeded manual of_node assignment
Date: Fri, 07 Dec 2018 12:24:28 +0100
Message-ID: <8a33e544f7f5c4ec24556484c8694379@milecki.pl>
References: <1544177406-24752-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544177406-24752-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 2018-12-07 11:10, Krzysztof Kozlowski wrote:
> This reverts the main change of commit bff23714bc36 ("leds: leds-gpio:
> Set of_node for created LED devices") because of_node assignment is
> handled by core since commit 7ea79ae86c28 ("leds: gpio: use OF variant
> of LED registering function").  Basically the code was overwriting the
> of_node with same value.
> 
> No functional change expected.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks!

Tested-by: Rafał Miłecki <rafal@milecki.pl>
