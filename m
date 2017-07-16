From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 0/2 v2] leds: tlc591xx: add missing of_node_put
Date: Sun, 16 Jul 2017 18:55:14 +0200
Message-ID: <a0ee66e6-3242-b057-c9ce-c192cffe55e8@gmail.com>
References: <1500112699-770-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <1500112699-770-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>, Richard Purdie <rpurdie@rpsys.net>
Cc: kernel-janitors@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Julia,

Thanks for the patch set.

On 07/15/2017 11:58 AM, Julia Lawall wrote:
> This series first merges two conditionals and then adds of_node_put on
> jumping out of for_each_child_of_node.
> 
> v2 adds the merge of conditionals, resulting in fewer of_node_put calls.

Applied to the for-next branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
